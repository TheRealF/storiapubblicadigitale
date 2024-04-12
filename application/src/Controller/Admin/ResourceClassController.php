<?php
namespace Omeka\Controller\Admin;

use Omeka\Mvc\Exception;
use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;

class ResourceClassController extends AbstractActionController
{
    public function showDetailsAction()
    {
        if (!$this->params('id')) {
            throw new Exception\NotFoundException;
        }

        $response = $this->api()->read('resource_classes', $this->params('id'));

        $view = new ViewModel;
        $view->setTerminal(true);
        $view->setVariable('resourceClass', $response->getContent());
        return $view;
    }
}
