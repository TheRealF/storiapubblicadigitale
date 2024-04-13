<?php declare(strict_types=1);

namespace ModelViewer;

return [
    'view_manager' => [
        'template_path_stack' => [
            dirname(__DIR__) . '/view',
        ],
    ],
    'file_renderers' => [
        'invokables' => [
            'model' => Media\FileRenderer\Model::class,

            // Aliases are not used to speed loading and to decrease memory use.

            'application/octet-stream' => Media\FileRenderer\Model::class,
            'application/vnd.threejs+json' => Media\FileRenderer\Model::class,
            'model/gltf-binary' => Media\FileRenderer\Model::class,
            'model/gltf+json' => Media\FileRenderer\Model::class,
            'model/obj' => Media\FileRenderer\Model::class,
            'model/vnd.collada+xml' => Media\FileRenderer\Model::class,
            // Unofficial mime-type that is used only here instead of "application/octet-stream".
            // This is a proprietary file format that is not recommended (extension .fbx).
            'model/vnd.filmbox' => Media\FileRenderer\Model::class,
            'dae' => Media\FileRenderer\Model::class,
            'fbx' => Media\FileRenderer\Model::class,
            'glb' => Media\FileRenderer\Model::class,
            'gltf' => Media\FileRenderer\Model::class,
            'obj' => Media\FileRenderer\Model::class,
            // TODO Add all media types supported by three js.
        ],
    ],
    'view_helpers' => [
        'invokables' => [
            'prepareModelViewer' => View\Helper\PrepareModelViewer::class,
        ],
    ],
    'form_elements' => [
        'invokables' => [
            Form\SettingsFieldset::class => Form\SettingsFieldset::class,
        ],
    ],
    'translator' => [
        'translation_file_patterns' => [
            [
                'type' => 'gettext',
                'base_dir' => dirname(__DIR__) . '/language',
                'pattern' => '%s.mo',
                'text_domain' => null,
            ],
        ],
    ],
    'modelviewer' => [
        'settings' => [
            'modelviewer_config_property' => null,
            // Json config.
            'modelviewer_config_default' => '',
        ],
    ],
];
