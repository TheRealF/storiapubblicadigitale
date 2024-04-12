<?php
namespace Omeka\Site\BlockLayout;

use Omeka\Api\Representation\SitePageBlockRepresentation;
use Omeka\Entity\SitePageBlock;
use Omeka\ServiceManager\SortableInterface;
use Omeka\Stdlib\ErrorStore;
use Laminas\View\Renderer\PhpRenderer;

abstract class AbstractBlockLayout implements BlockLayoutInterface, SortableInterface
{
    public function prepareForm(PhpRenderer $view)
    {
    }

    public function prepareRender(PhpRenderer $view)
    {
    }

    public function onHydrate(SitePageBlock $block, ErrorStore $errorStore)
    {
    }

    public function getFulltextText(PhpRenderer $view, SitePageBlockRepresentation $block)
    {
    }

    public function getSortableString()
    {
        return $this->getLabel();
    }
}
