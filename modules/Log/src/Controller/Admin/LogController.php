<?php declare(strict_types=1);

namespace Log\Controller\Admin;

use Common\Stdlib\PsrMessage;
use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;
use Log\Form\QuickSearchForm;
use Omeka\Form\ConfirmForm;

class LogController extends AbstractActionController
{
    /**
     * @var bool
     */
    protected $logDb;

    public function __construct($logDb)
    {
        $this->logDb = $logDb;
    }

    public function browseAction()
    {
        $this->browse()->setDefaults('logs');
        $query = $this->params()->fromQuery();

        $formSearch = $this->getForm(QuickSearchForm::class);
        $formSearch
            ->setAttribute('action', $this->url()->fromRoute(null, ['action' => 'browse'], true))
            ->setAttribute('id', 'log-search');
        if ($query) {
            $formSearch->setData($query);
            // TODO Don't check validity?
        }

        // TODO Manage multiple messages in/nin.
        $query += ['message' => []];
        if (!is_array($query['message'])) {
            $query['message'] = [['text' => $query['message'], 'type' => 'in']];
        }
        if (isset($query['message_not']) && strlen($query['message_not'])) {
            $query['message'][] = ['text' => $query['message_not'], 'type' => 'nin'];
            unset($query['message_not']);
        }

        $response = $this->api()->search('logs', $query);
        $this->paginator($response->getTotalResults(), $this->params()->fromQuery('page'));

        $formDeleteSelected = $this->getForm(ConfirmForm::class);
        $formDeleteSelected
            ->setAttribute('action', $this->url()->fromRoute('admin/log/default', ['action' => 'batch-delete'], true))
            ->setAttribute('id', 'confirm-delete-selected');
        $formDeleteSelected
            ->setButtonLabel('Confirm delete'); // @translate

        $formDeleteAll = $this->getForm(ConfirmForm::class);
        $formDeleteAll
            ->setAttribute('action', $this->url()->fromRoute('admin/log/default', ['action' => 'batch-delete-all'], true))
            ->setAttribute('id', 'confirm-delete-all')
            ->get('submit')->setAttribute('disabled', true);
        $formDeleteAll
            ->setButtonLabel('Confirm delete'); // @translate

        $logs = $response->getContent();

        if (!$this->logDb) {
            $this->messenger()->addWarning('The logger is currently disabled for database. Check config/local.config.php.'); // @translate
        }

        return new ViewModel([
            'logs' => $logs,
            'resources' => $logs,
            'formSearch' => $formSearch,
            'formDeleteSelected' => $formDeleteSelected,
            'formDeleteAll' => $formDeleteAll,
        ]);
    }

    public function showDetailsAction()
    {
        $linkTitle = false;
        $response = $this->api()->read('logs', $this->params('id'));
        $log = $response->getContent();

        $view = new ViewModel;
        $view
            ->setTerminal(true)
            ->setVariable('linkTitle', $linkTitle)
            ->setVariable('resource', $log)
            ->setVariable('log', $log);
        return $view;
    }

    public function deleteConfirmAction()
    {
        $linkTitle = false;
        $response = $this->api()->read('logs', $this->params('id'));
        $log = $response->getContent();

        $view = new ViewModel;
        $view
            ->setTerminal(true)
            ->setTemplate('common/delete-confirm-details')
            ->setVariable('resource', $log)
            ->setVariable('resourceLabel', 'log') // @translate
            ->setVariable('partialPath', 'log/admin/log/show-details')
            ->setVariable('linkTitle', $linkTitle)
            ->setVariable('log', $log);
        return $view;
    }

    public function deleteAction()
    {
        if ($this->getRequest()->isPost()) {
            $form = $this->getForm(ConfirmForm::class);
            $form->setData($this->getRequest()->getPost());
            if ($form->isValid()) {
                $response = $this->api($form)->delete('logs', $this->params('id'));
                if ($response) {
                    $this->messenger()->addSuccess('Log successfully deleted'); // @translate
                } else {
                    $this->messenger()->addError('An error occured during deletion of logs'); // @translate
                }
            } else {
                $this->messenger()->addFormErrors($form);
            }
        }
        return $this->redirect()->toRoute(
            'admin/log',
            ['action' => 'browse'],
            true
        );
    }

    public function batchDeleteAction()
    {
        if (!$this->getRequest()->isPost()) {
            return $this->redirect()->toRoute(null, ['action' => 'browse'], true);
        }

        $resourceIds = $this->params()->fromPost('resource_ids', []);
        if (!$resourceIds) {
            $this->messenger()->addError('You must select at least one log to batch delete.'); // @translate
            return $this->redirect()->toRoute(null, ['action' => 'browse'], true);
        }

        $form = $this->getForm(ConfirmForm::class);
        $form->setData($this->getRequest()->getPost());
        if ($form->isValid()) {
            $response = $this->api($form)->batchDelete('logs', $resourceIds, [], ['continueOnError' => true]);
            if ($response) {
                $this->messenger()->addSuccess('Logs successfully deleted'); // @translate
            } else {
                $this->messenger()->addError('An error occured during deletion of logs'); // @translate
            }
        } else {
            $this->messenger()->addFormErrors($form);
        }
        return $this->redirect()->toRoute(null, ['action' => 'browse'], true);
    }

    public function batchDeleteAllAction()
    {
        if (!$this->getRequest()->isPost()) {
            return $this->redirect()->toRoute(null, ['action' => 'browse'], true);
        }

        // Derive the query, removing limiting and sorting params.
        $query = json_decode($this->params()->fromPost('query', []), true);
        unset($query['submit'], $query['page'], $query['per_page'], $query['limit'],
            $query['offset'], $query['sort_by'], $query['sort_order']);

        $form = $this->getForm(ConfirmForm::class);
        $form->setData($this->getRequest()->getPost());
        if ($form->isValid()) {
            // TODO Manage multiple messages in/nin.
            $query += ['message' => []];
            if (!is_array($query['message'])) {
                $query['message'] = [['text' => $query['message'], 'type' => 'in']];
            }
            if (isset($query['message_not']) && strlen($query['message_not'])) {
                $query['message'][] = ['text' => $query['message_not'], 'type' => 'nin'];
                unset($query['message_not']);
            }

            $job = $this->jobDispatcher()->dispatch('Omeka\Job\BatchDelete', [
                'resource' => 'logs',
                'query' => $query,
            ]);
            $message = new PsrMessage(
                'Deleting logs in background (<a href="{job_url}">job #{job_id}</a>). This may take a while.', // @translate
                [
                    'job_url' => htmlspecialchars($this->url()->fromRoute('admin/id', ['controller' => 'job', 'id' => $job->getId()])),
                    'job_id' => $job->getId(),
                ]
            );
            $message->setEscapeHtml(false);
            $this->messenger()->addSuccess($message);
        } else {
            $this->messenger()->addFormErrors($form);
        }
        return $this->redirect()->toRoute(null, ['action' => 'browse'], true);
    }
}
