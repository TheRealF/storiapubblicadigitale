<?php
namespace Omeka\Controller\Site;

use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;

class ItemSetController extends AbstractActionController
{
    public function searchAction()
    {
    }

    public function browseAction()
    {
        $site = $this->currentSite();

        $query = $this->params()->fromQuery();
        $query['site_id'] = $site->id();
        $response = $this->api()->search('item_sets', $query);
        $this->paginator($response->getTotalResults());
        $itemSets = $response->getContent();

        $view = new ViewModel;
        $view->setVariable('site', $site);
        $view->setVariable('itemSets', $itemSets);
        $view->setVariable('resources', $itemSets);
        return $view;
    }
}
