<?php
namespace Omeka\Form;

use Laminas\Form\Form;

class ResourceTemplateImportForm extends Form
{
    public function init()
    {
        $this->add([
            'name' => 'file',
            'type' => 'file',
            'options' => [
                'label' => 'Resource template file', // @translate
            ],
            'attributes' => [
                'required' => true,
                'id' => 'file',
            ],
        ]);
    }
}
