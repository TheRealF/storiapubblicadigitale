<?php
namespace Omeka\Service\Form;

use Omeka\Form\ResourceForm;
use Laminas\ServiceManager\Factory\FactoryInterface;
use Interop\Container\ContainerInterface;

class ResourceFormFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $services, $requestedName, array $options = null)
    {
        $form = new ResourceForm;
        $form->setUrlHelper($services->get('ViewHelperManager')->get('Url'));
        $form->setEventManager($services->get('EventManager'));
        $form->setResource($options['resource'] ?? null);
        return $form;
    }
}
