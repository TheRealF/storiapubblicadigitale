<?php
namespace Omeka\Service\Controller;

use Interop\Container\ContainerInterface;
use Omeka\Controller\MigrateController;
use Laminas\ServiceManager\Factory\FactoryInterface;

class MigrateControllerFactory implements FactoryInterface
{
    public function __invoke(ContainerInterface $services, $requestedName, array $options = null)
    {
        return new MigrateController(
            $services->get('Omeka\MigrationManager'),
            $services->get('Omeka\Environment')
        );
    }
}
