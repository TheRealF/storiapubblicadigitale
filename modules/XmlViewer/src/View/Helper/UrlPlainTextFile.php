<?php declare(strict_types=1);

namespace XmlViewer\View\Helper;

use Laminas\View\Helper\AbstractHelper;
use Omeka\Api\Representation\AbstractResourceEntityRepresentation;

class UrlPlainTextFile extends AbstractHelper
{
    /**
     * Get the url of the dynamic xml to html converter.
     *
     * @param AbstractResourceEntityRepresentation|string $resourceOrUrl
     * @param array Options to customize the source url:
     *   - generic (bool): allows to use the generic url instead of site one;
     *   - query (array): a query to append to the url.
     *   - render (string|array): a specific stylesheet to use for rendering;
     *   - force_canonical (bool): return an absolute url.
     */
    public function __invoke($resourceOrUrl, array $options = []): ?string
    {
        /** @var \Laminas\View\Helper\Url $url */
        $plugins = $this->getView()->getHelperPluginManager();
        $url = $plugins->get('url');

        $urlOptions = [];
        if (empty($options)) {
            $genericUrl = false;
        } else {
            $genericUrl = !empty($options['generic']);
            if (!empty($options['query'])) {
                $urlOptions['query'] = $options['query'];
            }
            if (isset($options['render'])) {
                $urlOptions['query']['render'] = $options['render'];
            }
            $urlOptions['force_canonical'] = !empty($options['force_canonical']);
        }

        $siteSlug = $genericUrl ? '' : $plugins->get('params')->fromRoute('site-slug');
        if (is_string($resourceOrUrl)) {
            $urlOptions['query']['source'] = $resourceOrUrl;
            return $genericUrl || !$siteSlug
                ? $url('xml', [], $urlOptions)
                : $url('site/xml', ['site-slug' => $siteSlug], $urlOptions);
        } elseif (is_object($resourceOrUrl) && $resourceOrUrl instanceof AbstractResourceEntityRepresentation) {
            return $genericUrl || !$siteSlug
                ? $url('xml/resource-id', ['id' => $resourceOrUrl->id()], $urlOptions)
                : $url('site/xml/resource-id', ['site-slug' => $siteSlug, 'id' => $resourceOrUrl->id()], $urlOptions);
        }
        return null;
    }
}
