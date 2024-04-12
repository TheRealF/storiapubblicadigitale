<?php
namespace OmekaTest\Api\Adapter;

use Omeka\Api\Adapter\Manager;
use Omeka\Test\TestCase;

class ManagerTest extends TestCase
{
    protected $manager;

    public function setUp(): void
    {
        $serviceManager = $this->getServiceManager([
            'EventManager' => $this->getMockForAbstractClass('Laminas\EventManager\EventManagerInterface'),
            'MvcTranslator' => $this->getMockForAbstractClass('Laminas\I18n\Translator\TranslatorInterface'),
        ]);
        $this->manager = new Manager($serviceManager);
    }

    public function testValidateRequiresAdapterInterface()
    {
        $this->expectException('Laminas\ServiceManager\Exception\InvalidServiceException');
        $this->manager->validate(new \stdClass);
    }
}
