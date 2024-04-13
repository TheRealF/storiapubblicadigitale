<?php declare(strict_types=1);

namespace XmlViewer;

return [
    'view_manager' => [
        'template_path_stack' => [
            dirname(__DIR__) . '/view',
        ],
    ],
    'view_helpers' => [
        'invokables' => [
            'urlPlainTextFile' => View\Helper\UrlPlainTextFile::class,
        ],
    ],
    'form_elements' => [
        'invokables' => [
            Form\SettingsFieldset::class => Form\SettingsFieldset::class,
            Form\SiteSettingsFieldset::class => Form\SiteSettingsFieldset::class,
        ],
    ],
    'controllers' => [
        'factories' => [
            Controller\IndexController::class => Service\Controller\IndexControllerFactory::class,
        ],
    ],
    'file_renderers' => [
        // Aliases are not used to speed loading and to decrease memory use.
        'invokables' => [
            'xml' => Media\FileRenderer\Xml::class,
        ],
    ],
    'router' => [
        'routes' => [
            'site' => [
                'child_routes' => [
                    'xml' => [
                        'type' => \Laminas\Router\Http\Literal::class,
                        'options' => [
                            'route' => '/xml',
                            'defaults' => [
                                '__NAMESPACE__' => Controller\IndexController::class,
                                'controller' => Controller\IndexController::class,
                                'action' => 'index',
                            ],
                        ],
                        'may_terminate' => false,
                        'child_routes' => [
                            // Id can be a clean url id ("/" must be escaped, like in iiif).
                            'resource-id' => [
                                'type' => \Laminas\Router\Http\Segment::class,
                                'options' => [
                                    'route' => '/:id',
                                    'constraints' => [
                                        'id' => '[^\/]+',
                                    ],
                                    'defaults' => [
                                        'action' => 'show',
                                    ],
                                ],
                            ],
                        ],
                    ],
                ],
            ],
            // Admin view and generic public are the same.
            'xml' => [
                'type' => \Laminas\Router\Http\Literal::class,
                'options' => [
                    'route' => '/xml',
                    'defaults' => [
                        '__NAMESPACE__' => Controller\IndexController::class,
                        'controller' => Controller\IndexController::class,
                        'action' => 'index',
                    ],
                ],
                'may_terminate' => false,
                'child_routes' => [
                    // Id can be a clean url id ("/" must be escaped, like in iiif).
                    'resource-id' => [
                        'type' => \Laminas\Router\Http\Segment::class,
                        'options' => [
                            'route' => '/:id',
                            'constraints' => [
                                'id' => '[^\/]+',
                            ],
                            'defaults' => [
                                'action' => 'show',
                            ],
                        ],
                    ],
                ],
            ],
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
    'xmlviewer' => [
        'settings' => [
            'xmlviewer_renderings' => [
                'text/xml' => 'xsl/xml-html.xslt',
                'application/xml' => 'xsl/xml-html.xslt',
                'application/alto+xml' => 'xsl/xml-alto-html.xslt',
            ],
        ],
        'site_settings' => [
            'xmlviewer_renderings' => [
                'text/xml' => 'xsl/xml-html.xslt',
                'application/xml' => 'xsl/xml-html.xslt',
                'application/alto+xml' => 'xsl/xml-alto-html.xslt',
            ],
        ],
    ],
];
