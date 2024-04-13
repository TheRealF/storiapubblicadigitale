<?php declare(strict_types=1);

namespace ModelViewer\Media\FileRenderer;

use Laminas\View\Renderer\PhpRenderer;
use Omeka\Api\Representation\MediaRepresentation;
use Omeka\Media\FileRenderer\RendererInterface;

class Model implements RendererInterface
{
    /**
     * The default partial view script.
     */
    const PARTIAL_NAME = 'common/model-viewer';

    /**
     * @var array
     */
    protected $defaultOptions = [
        'template' => self::PARTIAL_NAME,
        'attributes' => [
            'class' => 'model-viewer',
            'allowfullscreen' => 'allowfullscreen',
            'style' => 'height: 600px; height: 70vh; width: 100%; border: none;',
        ],
    ];

    /**
     * Render a media via the library Three js.
     *
     * @todo Factorize with the view helper.
     *
     * @param PhpRenderer $view,
     * @param MediaRepresentation $media
     * @param array $options These options are managed for sites:
     *   - template: the partial to use.
     *   - attributes: set the attributes of the iframe as a array; the default
     *     class "model-viewer" is added and default height and width too (style).
     *   - config: config of the viewer, overriding resource and admin settings.
     * @return string
     */
    public function render(PhpRenderer $view, MediaRepresentation $media, array $options = [])
    {
        $plugins = $view->getHelperPluginManager();

        $status = $view->status();
        if ($status->isSiteRequest()) {
            $template = $options['template'] ?? $this->defaultOptions['template'];
            if (empty($options['attributes'])) {
                $options['attributes'] = $this->defaultOptions['attributes'];
            } else {
                // Check attributes for security.
                $escapeAttr = $plugins->get('escapeHtmlAttr');
                foreach ($options['attributes'] as $name => $value) {
                    if ($value === false || preg_match('/[^\w:.-]/', $name)) {
                        unset($options['attributes'][$name]);
                    } elseif ($value === true) {
                        $options['attributes'][$name] = $name;
                    } else {
                        $options['attributes'][$name] = $escapeAttr($value);
                    }
                }
                if (empty($options['attributes']['class'])) {
                    $options['attributes']['class'] = 'model-viewer';
                } elseif (strpos($options['attributes']['class'], 'model-viewer') === false) {
                    $options['attributes']['class'] = 'model-viewer ' . $options['attributes']['class'];
                }
            }
        } else {
            $template = $this->defaultOptions['template'];
            $options['attributes'] = $this->defaultOptions['attributes'];
        }

        unset($options['template']);

        $vars = [
            'resource' => $media,
            'options' => $options,
        ];

        $partial = $plugins->get('partial');
        return $template !== self::PARTIAL_NAME && $view->resolver($template)
            ? $partial($template, $vars)
            : $partial(self::PARTIAL_NAME, $vars);
    }
}
