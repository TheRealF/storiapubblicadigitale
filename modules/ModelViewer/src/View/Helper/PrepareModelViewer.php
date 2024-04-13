<?php declare(strict_types=1);

namespace ModelViewer\View\Helper;

use Laminas\View\Helper\AbstractHelper;
use Omeka\Api\Representation\AbstractResourceEntityRepresentation;
use Omeka\Api\Representation\MediaRepresentation;

class PrepareModelViewer extends AbstractHelper
{
    /**
     * Get all options for the model viewer (threejs) and init css/js.
     *
     * The resource may be empty: in that cases, options['source'] must be set
     * and options['mediaType'] is recommended.
     *
     * @param \Omeka\Api\Representation\AbstractResourceEntityRepresentation $resource
     * @param array $options
     * @return array|null Returns null in case of error.
     */
    public function __invoke(?AbstractResourceEntityRepresentation $resource, array $options = []): ?array
    {
        static $commonConfig;
        static $property;

        $view = $this->getView();

        // Merge config: theme, then media, site, global, default.
        // TODO No site setting for now.
        if (!$commonConfig) {
            $setting = $view->plugin('setting');
            $mainConfig = $setting('modelviewer_config_default');
            if ($mainConfig) {
                $mainConfig = json_decode($mainConfig, true);
                if (!is_array($mainConfig)) {
                    $mainConfig = [];
                    $view->logger()->warn('[Model viewer]: Main config is not a valid json.'); // @translate
                }
            } else {
                $mainConfig = [];
            }
            $commonConfig = $mainConfig;
            $property = $setting('modelviewer_config_property');
        }

        $supported = [
            'application/octet-stream',
            'application/vnd.threejs+json',
            'model/gltf-binary',
            'model/gltf+json',
            'model/mtl',
            'model/obj',
            'model/vnd.collada+xml',
            // Unofficial mime-type that is used only here instead of "application/octet-stream".
            // This is a proprietary file format that is not recommended (extension .fbx).
            'model/vnd.filmbox',
        ];
        $extensionMediaTypes = [
            'glb' => 'model/gltf-binary',
            'fbx' => 'model/vnd.filmbox',
        ];

        $item = null;
        $media = null;
        if ($resource instanceof \Omeka\Api\Representation\ItemRepresentation) {
            $item = $resource;
            // Get the main media.
            foreach ($resource->media() as $itemMedia) {
                $mediaType = $itemMedia->mediaType();
                if (in_array($mediaType, $supported)) {
                    $extension = $itemMedia->extension();
                    if ($mediaType === 'application/octet-stream' && isset($extensionMediaTypes[$extension])) {
                        $media = $itemMedia;
                        $mediaType = $extensionMediaTypes[$extension];
                        break;
                    }
                }
            }
            if (!$media) {
                return null;
            }
        } elseif ($resource instanceof \Omeka\Api\Representation\MediaRepresentation) {
            $mediaType = $resource->mediaType();
            if (!in_array($mediaType, $supported)) {
                return null;
            }
            $extension = $resource->extension();
            if ($mediaType === 'application/octet-stream') {
                if (!isset($extensionMediaTypes[$extension])) {
                    return null;
                }
                $mediaType = $extensionMediaTypes[$extension];
            }
            $media = $resource;
            $item = $media->item();
        } elseif (empty($options['source'])) {
            return null;
        } elseif (empty($options['mediaType'])) {
            $mediaType = 'model/gltf+json';
        } elseif (in_array($options['mediaType'], $supported)) {
            $mediaType = $options['mediaType'];
        } else {
            return null;
        }

        // TODO Only the id, the source, the config and eventually the media type are needed.
        $options['id'] = $options['id'] ?? ($media ? 'model-' . $media->id() : 'model-0');
        $options['source'] = empty($options['source']) ? $media->originalUrl() : $options['source'];
        // $options['dirpath'] = dirname($options['source']) . '/';
        // $options['filename'] = basename($options['source']);
        $options['mediaType'] = $mediaType;
        // $options['extension'] = $media ? $media->extension() : null;
        // A special option to load materials for collada or .obj.
        $options['mtl'] = $options['mtl'] ?? [];

        // Check associated files if they are not listed in the main file for
        // some formats.
        if ($item) {
            foreach ($item->media() as $itemMedia) {
                $extension = $itemMedia->extension();
                if ($extension === 'mtl') {
                    $options['mtl'][] = $media->originalUrl();
                }
            }
        }

        $config = $commonConfig;

        if ($property) {
            $mediaConfig = $media->value($property);
            if ($mediaConfig) {
                $mediaConfig = json_decode($mediaConfig->value(), true);
                if (is_array($mediaConfig)) {
                    foreach ($mediaConfig as $key => $element) {
                        $config[$key] = isset($config[$key]) && is_array($config[$key])
                            ? array_merge($config[$key], $element)
                            : $element;
                    }
                } else {
                    $view->logger()->warn(sprintf('[Model viewer]: Specific config for media %d is not a valid json.', $media->id())); // @translate
                }
            }
        }

        if (empty($options['config'])) {
            $options['config'] = $config;
        } else {
            foreach ($mediaConfig as $key => $element) {
                $options['config'][$key] = isset($options['config'][$key]) && is_array($options['config'][$key])
                    ? array_merge($options['config'][$key], $element)
                    : $element;
            }
        }

        $this->initAssets($media, $options);

        return $options;
    }

    /**
     * Avoid to load assets multiple times.
     */
    protected function initAssets(?MediaRepresentation $media, array $options): void
    {
        static $hasModelViewer = false;
        static $jsFiles = [];
        static $assetUrl;
        static $headScript;

        $view = $this->getView();

        $mediaType = $options['mediaType'];

        if (!$hasModelViewer) {
            $assetUrl = $view->plugin('assetUrl');
            $view->headLink()
                ->appendStylesheet($assetUrl('css/model-viewer.css', 'ModelViewer'));
            // Js modules are not used because they are not enough browser-supported
            // yet and the jsm requires a path that is relative to the main
            // threejs libray in examples.
            $headScript = $view->headScript()
                ->appendFile($assetUrl('vendor/threejs/three.min.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);

            // Keep all files to load them one time only, when needed.
            $jsFiles = [];
            $dir = dirname(__DIR__, 3) . '/asset/vendor/threejs/js';
            $dirLength = strlen($dir) + 1;
            foreach ($this->listFiles($dir) as $file) {
                $jsFiles[substr($file->getPathName(), $dirLength, -3)] = true;
            }
        }

        // Load only assets not yet loaded by a previous model in the page.

        // Load common loaders even when they are not set in config.
        switch ($mediaType) {
            case 'model/gltf-binary':
            case 'model/gltf+json':
            case 'model/gltf':
                if (isset($jsFiles['loaders/GLTFLoader'])) {
                    $headScript
                        ->appendFile($assetUrl('vendor/threejs/js/loaders/GLTFLoader.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
                    $jsFiles['loaders/GLTFLoader'] = null;
                }
                break;
            case 'model/obj':
                if (isset($jsFiles['loaders/OBJLoader'])) {
                    $headScript
                         ->appendFile($assetUrl('vendor/threejs/js/loaders/OBJLoader.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
                     $jsFiles['loaders/OBJLoader'] = null;
                }
                break;
            case 'model/vnd.collada+xml':
                if (isset($jsFiles['loaders/ColladaLoader'])) {
                    $headScript
                        ->appendFile($assetUrl('vendor/threejs/js/loaders/ColladaLoader.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
                    $jsFiles['loaders/ColladaLoader'] = null;
                }
                break;
            case 'model/vnd.filmbox':
                if (isset($jsFiles['libs/fflate.min'])) {
                    $headScript
                        ->appendFile($assetUrl('vendor/threejs/js/libs/fflate.min.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
                    $jsFiles['libs/fflate.min'] = null;
                }
                if (isset($jsFiles['loaders/FBXLoader'])) {
                    $headScript
                        ->appendFile($assetUrl('vendor/threejs/js/loaders/FBXLoader.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
                    $jsFiles['loaders/FBXLoader'] = null;
                }
                break;
            case 'application/vnd.threejs+json':
                // Vrml loader require Gltf loader.
                if (isset($jsFiles['libs/chevrotain.min'])) {
                    $headScript
                        ->appendFile($assetUrl('vendor/threejs/js/libs/chevrotain.min.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
                    $jsFiles['libs/chevrotain.min'] = null;
                }
                if (isset($jsFiles['loaders/GLTFLoader'])) {
                    $headScript
                        ->appendFile($assetUrl('vendor/threejs/js/loaders/GLTFLoader.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
                    $jsFiles['loaders/GLTFLoader'] = null;
                }
                if (isset($jsFiles['loaders/VRMLoader'])) {
                    $headScript
                        ->appendFile($assetUrl('vendor/threejs/js/loaders/VRMLoader.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
                    $jsFiles['loaders/VRMLoader'] = null;
                }
                break;
            default:
                break;
        }
        // Issue without mime-type for mtl.
        if (!empty($options['mtl'])) {
            if (isset($jsFiles['loaders/DDSLoader'])) {
                $headScript
                    ->appendFile($assetUrl('vendor/threejs/js/loaders/DDSLoader.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
                $jsFiles['loaders/DDSLoader'] = null;
            }
            if (isset($jsFiles['loaders/MTLLoader'])) {
                $headScript
                    ->appendFile($assetUrl('vendor/threejs/js/loaders/MTLLoader.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
                $jsFiles['loaders/MTLLoader'] = null;
            }
        }

        if (!empty($options['config']['animation']) && !array_key_exists('gsap', $jsFiles)) {
            $headScript
                ->appendFile($assetUrl('vendor/gsap/gsap.min.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
            $jsFiles['gsap'] = null;
        }

        $jsModuleKeys = [
            'animation',
            'cameras',
            'controls',
            'csm',
            'curves',
            'deprecated',
            'effects',
            'environments',
            'exporters',
            'geometries',
            'helpers',
            'interactive',
            'libs',
            'lights',
            'lines',
            'loaders',
            'math',
            'misc',
            'modifiers',
            'objects',
            'physics',
            'postprocessing',
            'renderers',
            'shaders',
            'textures',
            'utils',
        ];
        foreach ($jsModuleKeys as $jsModuleKey) {
            if (empty($options['config']['import'][$jsModuleKey])) {
                continue;
            }
            if (!is_array($options['config']['import'][$jsModuleKey])) {
                $options['config']['import'][$jsModuleKey] = [$options['config']['import'][$jsModuleKey]];
            }
            foreach ($options['config']['import'][$jsModuleKey] as $jsModule) {
                $jsFile = "$jsModuleKey/$jsModule";
                if (isset($jsFiles[$jsFile])) {
                    $headScript
                        ->appendFile($assetUrl('vendor/threejs/js/' . $jsFile . '.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
                    $jsFiles[$jsFile] = null;
                }
            }
        }

        // A control is required.
        if (empty($options['config']['import']['controls']) && isset($jsFiles['controls/OrbitControls'])) {
            $headScript
                ->appendFile($assetUrl('vendor/threejs/js/controls/OrbitControls.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
            $jsFiles['controls/OrbitControls'] = null;
        }

        // Should be loaded last (asynchronous anyway).
        // TODO Check if it works in all cases (multiple model viewers with various configs).
        if (!$hasModelViewer) {
            $hasModelViewer = true;
            $headScript
                ->appendFile($assetUrl('js/model-viewer.js', 'ModelViewer'), 'text/javascript', ['defer' => 'defer']);
        }
    }

    protected function listFiles(string $directory): \Generator
    {
        if (is_dir($directory) && is_readable($directory)) {
            $iterator = new \RecursiveDirectoryIterator($directory);
            $iterator = new \RecursiveIteratorIterator($iterator);
            $iterator = new \RegexIterator($iterator, '/\.js$/', \RegexIterator::MATCH);
            yield from $iterator;
        }
    }
}
