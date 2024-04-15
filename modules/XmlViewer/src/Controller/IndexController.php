<?php declare(strict_types=1);

namespace XmlViewer\Controller;

use Laminas\Mvc\Controller\AbstractActionController;
use Laminas\View\Model\ViewModel;
use Omeka\File\Exception\InvalidArgumentException;
use Omeka\Stdlib\Message;

class IndexController extends AbstractActionController
{
    /**
     * @var string
     */
    protected $basePath;

    public function __construct(string $basePath)
    {
        $this->basePath = $basePath;
    }

    public function indexAction()
    {
        return $this->showAction();
    }

    public function showAction()
    {
        $id = $this->params('id');
        // Not found is automatically thrown with "read".
        /** @var \Omeka\Api\Representation\MediaRepresentation $resource */
        $resource = $this->api()->read('media', ['id' => $id])->getContent();

        if ($resource->renderer() !== 'file') {
            throw new InvalidArgumentException((string) new Message(
                'Media #%s is not a file.', // @translate
                $id
            ));
        }

        if (!$resource->hasOriginal()) {
            throw new InvalidArgumentException((string) new Message(
                'Media #%s has no original file.', // @translate
                $id
            ));
        }

        $originalUrl = $resource->originalUrl();
        if (!$originalUrl) {
            throw new InvalidArgumentException((string) new Message(
                'Media #%s has no original file url.', // @translate
                $id
            ));
        }

        $filepath = $resource->filename();
        $filepath = sprintf('%s/original/%s', $this->basePath, $filepath);
        if (!is_readable($filepath)) {
            throw new InvalidArgumentException((string) new Message(
                'Media #%s has no readable file.', // @translate
                $resource->id()
            ));
        }

        $siteSlug = $this->params('site-slug');
        $renderings = $siteSlug
           ? $this->siteSettings()->get('xmlviewer_renderings', [])
           : $this->settings()->get('xmlviewer_renderings', []);
        $mediaType = $resource->mediaType();
        $rendering = $renderings[$mediaType] ?? '';
        $filesize = (int) $resource->size();

        $render = $this->params()->fromQuery('render');

        if (empty($filesize)
            || !$mediaType
            // For security, there should be a default rendering even when a
            // render is set in the query.
            || empty($rendering)
            || $rendering === 'false'
            || $rendering === 'no'
            || (!empty($render) && in_array($render, ['false', 'no']))
        ) {
            $view = new ViewModel([
                'resource' => $resource,
                'media' => $resource,
                'options' => [],
            ]);
            return $view
                ->setTemplate('common/xml-fallback')
                ->setTerminal(true);
        }

        // Check render.
        if ($render) {
            if (is_array($render)) {
                $render = implode('|', $render);
            }
            $rendering = $render;
        }

        // In order to be displayed as xml in an iframe, the content-type should
        // be "text/plain". "text/html" skips the xml instructions. "text/xml" or
        // "application/xml" are silently read like html, even if it works in a
        // full page, except with a stylesheet xsl.

        // With Chrome, a stylesheet at the end of an xml file works in a iframe,
        // but not in full page, so the stylesheet should be inserted after the
        // xml header. But the length of the header is not fixed, there may be
        // spaces, not utf-8, etc.

        // So if there is no memory issue (check length), it should be added at
        // the position of the first ">".

        $filename = $resource->source() ?: basename($filepath);

        $contentMediaType = 'text/plain';
        $piStylesheet = '';
        if ($rendering === 'original') {
            // The media type is forced because some browsers on some operating
            // systems force downloading for precise xml media-types.
            // "text/xml" and "application/xml" are synonymous for browsers.
            $contentMediaType = 'application/xml';
        } elseif (!in_array($rendering, ['text', 'plain', 'text/plain', 'true'])) {
            $assetUrl = $this->viewHelpers()->get('assetUrl');
            foreach (array_filter(array_map('trim', explode('|', $rendering))) as $stylesheet) {
                $extension = strtolower(pathinfo($rendering, PATHINFO_EXTENSION));
                if (!in_array($extension, ['css', 'xsl', 'xslt'])) {
                    continue;
                }
                if (substr($stylesheet, 0, 1) !== '/'
                    && substr($stylesheet, 0, 8) !== 'https://'
                    && substr($stylesheet, 0, 7) !== 'http://'
                ) {
                    $stylesheet = $assetUrl($stylesheet, 'XmlViewer', true);
                }
                $piStylesheet .= sprintf("\n" . '<?xml-stylesheet type="text/%s" href="%s" ?>', $extension === 'xslt' ? 'xsl' : $extension, $stylesheet);
            }
            if ($piStylesheet) {
                $contentMediaType = 'application/xml';
            }
        }

        $dispositionMode = 'inline';

        /** @var \Laminas\Http\PhpEnvironment\Response $response */
        $response = $this->getResponse();
        // Write headers.
        $response->getHeaders()
            ->addHeaderLine(sprintf('Content-Type: %s', $contentMediaType))
            ->addHeaderLine(sprintf('Content-Disposition: %s; filename="%s"', $dispositionMode, $filename))
            ->addHeaderLine(sprintf('Content-Length: %s', $filesize + strlen($piStylesheet)))
            ->addHeaderLine('Content-Transfer-Encoding', 'binary')
            // Use this to open files directly.
            ->addHeaderLine('Cache-Control: private');
        // Send headers separately to handle large files.
        $response->sendHeaders();

        // TODO Use Laminas stream response.

        // Clears all active output buffers to avoid memory overflow.
        $response->setContent('');
        while (ob_get_level()) {
            ob_end_clean();
        }

        if ($piStylesheet) {
            // file_get_contents and file_put_contents are not used to avoid
            // memory issue with big xml files.
            // TODO Check XmlWriter?
            $handle = fopen($filepath, 'rb');
            $content = fread($handle, 8192);
            $pos = mb_strpos($content, '>');
            // A xml file without a ">" in the first 8192 bytes does not exist.
            if ($pos === false) {
                fclose($handle);
                readfile($filepath);
            } else {
                $length = $pos + 1;
                rewind($handle);
                echo fread($handle, $length);
                echo $piStylesheet;
                echo fread($handle, $filesize - $length);
                fclose($handle);
            }
        } else {
            readfile($filepath);
        }

        // TODO Fix issue with session. See readme.
        ini_set('display_errors', '0');

        // Return response to avoid default view rendering and to manage events.
        return $response;
    }
}
