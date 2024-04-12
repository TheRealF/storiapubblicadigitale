<?php
namespace Omeka\View\Helper;

use Laminas\View\Helper\AbstractHelper;

/**
 * View helper for rendering a sorting form.
 */
class SortSelector extends AbstractHelper
{
    /**
     * The default partial view script.
     */
    const PARTIAL_NAME = 'common/sort-selector';

    /**
     * Render sorting form.
     *
     * @param array $sortBy Array of sorting options, each a sub-array with keys "label" and "value"
     * @param string|null $partialName Name of view script, or a view model
     * @return string
     */
    public function __invoke($sortBy, $partialName = null)
    {
        // Convert to the new sort configuration structure.
        $sortConfig = [];
        foreach ($sortBy as $sortByOption) {
            $sortConfig[$sortByOption['value']] = $sortByOption['label'];
        }

        $partialName = $partialName ?: self::PARTIAL_NAME;

        $view = $this->getView();
        $params = $view->params();
        $sortByQuery = $params->fromQuery('sort_by');
        $sortOrderQuery = $params->fromQuery('sort_order');

        $args = [
            'sortConfig' => $sortConfig,
            'sortByQuery' => $sortByQuery,
            'sortOrderQuery' => $sortOrderQuery,
        ];
        $args = $view->trigger('view.sort-selector', $args, true);

        return $view->partial($partialName, (array) $args);
    }
}
