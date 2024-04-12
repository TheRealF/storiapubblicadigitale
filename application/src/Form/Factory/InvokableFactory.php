<?php
namespace Omeka\Form\Factory;

use Interop\Container\ContainerInterface;
use Laminas\ServiceManager\Factory\FactoryInterface;

/**
 * Factory for instantiating "invokable" forms.
 *
 * The normal invokable factory incorrectly sets the options to the wrong argument on construction.
 */
class InvokableFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $container, $requestedName, array $options = null)
    {
        return (null === $options) ? new $requestedName : new $requestedName(null, $options);
    }
}
