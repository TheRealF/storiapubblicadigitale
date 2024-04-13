<?php declare(strict_types=1);

namespace ModelViewer\Form;

use Laminas\Form\Fieldset;
use Laminas\Form\Element\Textarea;
use Omeka\Form\Element\PropertySelect;

class SettingsFieldset extends Fieldset
{
    protected $label = 'Model Viewer'; // @translate

    public function init(): void
    {
        $this
            ->setAttribute('id', 'model-viewer')
            ->add([
                'name' => 'modelviewer_config_property',
                'type' => PropertySelect::class,
                'options' => [
                    'label' => 'Media property for specific config', // @translate
                    'info' => 'It is recommended to hide it on public display.', // @translate
                    'term_as_value' => true,
                ],
                'attributes' => [
                    'id' => 'modelviewer_config_property',
                ],
            ])
            ->add([
                'name' => 'modelviewer_config_default',
                'type' => Textarea::class,
                'options' => [
                    'label' => 'Default scene config (json)', // @translate
                    'infos' => 'This config is used to set default params and each key may be overridden by the model. The json is not checked, so verify commas and double quotes or use https://jsonformatter.org.', // translate
                    'documentation' => 'https://gitlab.com/Daniel-KM/Omeka-S-module-ModelViewer#default-config',
                ],
                'attributes' => [
                    'id' => 'modelviewer_config_default',
                ],
            ])
        ;
    }
}
