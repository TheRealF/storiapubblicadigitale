<?php
namespace OmekaTest\Mvc;

use Omeka\Mvc\MvcListeners;
use Omeka\Test\TestCase;

class MvcListenersTest extends TestCase
{
    protected $mvcListeners;

    public function setUp(): void
    {
        $this->mvcListeners = new MvcListeners;
    }

    public function testRedirectToInstallation()
    {
        $event = $this->getEventForRedirectToInstallation(['is_installed' => true]);
        $return = $this->mvcListeners->redirectToInstallation($event);
        $this->assertNull($return);

        $event = $this->getEventForRedirectToInstallation(['is_install_route' => true]);
        $return = $this->mvcListeners->redirectToInstallation($event);
        $this->assertNull($return);

        $event = $this->getEventForRedirectToInstallation();
        $return = $this->mvcListeners->redirectToInstallation($event);
        $this->assertInstanceOf('Laminas\Http\PhpEnvironment\Response', $return);
    }

    protected function getEventForRedirectToInstallation(array $options = [])
    {
        $options['is_installed'] = isset($options['is_installed']) ? true : false;
        $options['is_install_route'] = isset($options['is_install_route']) ? true : false;

        $event = $this->createMock('Laminas\Mvc\MvcEvent');

        // Laminas\Mvc\Application
        $application = $this->getMockBuilder('Laminas\Mvc\Application')
            ->disableOriginalConstructor()
            ->getMock();
        $status = $this->getMockBuilder('Omeka\Mvc\Status')->disableOriginalConstructor()->getMock();
        $status->expects($this->any())
            ->method('isInstalled')
            ->will($this->returnValue($options['is_installed'] ? true : false));
        $serviceManager = $this->getServiceManager([
            'Omeka\Status' => $status,
        ]);
        $application->expects($this->any())
            ->method('getServiceManager')
            ->will($this->returnValue($serviceManager));
        $event->expects($this->any())
            ->method('getApplication')
            ->will($this->returnValue($application));

        // Laminas\Mvc\Router\RouteMatch
        $routeMatch = $this->getMockBuilder('Laminas\Router\RouteMatch')
            ->disableOriginalConstructor()
            ->getMock();
        $routeMatch->expects($this->any())
            ->method('getMatchedRouteName')
            ->will($this->returnValue($options['is_install_route'] ? 'install' : 'foobar'));
        $event->expects($this->any())
            ->method('getRouteMatch')
            ->will($this->returnValue($routeMatch));

        // Laminas\Mvc\Router\RouteStackInterface
        $router = $this->createMock('Laminas\Router\RouteStackInterface');
        $router->expects($this->any())
            ->method('assemble')
            ->with($this->equalTo([]), $this->equalTo(['name' => 'install']));
        $event->expects($this->any())
            ->method('getRouter')
            ->will($this->returnValue($router));

        // Laminas\Http\PhpEnvironment\Response
        $headers = $this->createMock('Laminas\Http\Headers');
        $headers->expects($this->any())
            ->method('addHeaderLine')
            ->with($this->equalTo('Location'));
        $response = $this->createMock('Laminas\Http\PhpEnvironment\Response');
        $response->expects($this->any())
            ->method('getHeaders')
            ->will($this->returnValue($headers));
        $response->expects($this->any())
            ->method('setStatusCode')
            ->will($this->returnValue(302));
        $event->expects($this->any())
            ->method('getResponse')
            ->will($this->returnValue($response));

        return $event;
    }
}
