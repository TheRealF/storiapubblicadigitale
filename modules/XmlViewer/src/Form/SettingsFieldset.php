<?php declare(strict_types=1);

namespace XmlViewer\Form;

use Laminas\Form\Fieldset;
use Omeka\Form\Element\ArrayTextarea;

class SettingsFieldset extends Fieldset
{
    protected $label = 'XML Viewer'; // @translate

    protected $elementGroups = [
        // "Player" is used instead of viewer, because "viewer" is used for a site
        // user role and cannot be translated differently (no context).
        // Player is polysemic too anyway, but less used and more adapted for
        // non-image viewers.
        'player' => 'Players', // @translate
    ];

    public function init(): void
    {
        $this
            ->setAttribute('id', 'xml-viewer')
            ->setOption('element_groups', $this->elementGroups)
            ->add([
                'name' => 'xmlviewer_renderings',
                'type' => ArrayTextarea::class,
                'options' => [
                    'element_group' => 'player',
                    'label' => 'Render by xml media-type', // @translate
                    'info' => 'Set the rendering as a stylesheet (xsl or css, full url or asset file) or a specific format ("text", "original", "no") to use by media-type, one by line. Other xml types are rendered as a download link. You may set precise media-types with module Bulk Edit too.', // @translate
                    'documentation' => 'https://gitlab.com/Daniel-KM/Omeka-S-module-XmlViewer#usage',
                    'as_key_value' => true,
                ],
                'attributes' => [
                    'id' => 'xmlviewer_renderings',
                    'rows' => 5,
                    'placeholder' => 'text/xml = text
application/xml = xsl/xml-html.xslt
application/tei+xml = vendor/teinte/tei2html.xsl
',
                ],
            ]);
    }
}
