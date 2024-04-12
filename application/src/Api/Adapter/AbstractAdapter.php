<?php
namespace Omeka\Api\Adapter;

use Omeka\Api\Exception;
use Omeka\Api\Request;
use Omeka\Api\ResourceInterface;
use Laminas\EventManager\Event;
use Laminas\EventManager\EventManagerAwareTrait;
use Laminas\I18n\Translator\TranslatorInterface;
use Laminas\ServiceManager\ServiceLocatorInterface;

/**
 * Abstract API adapter.
 */
abstract class AbstractAdapter implements AdapterInterface
{
    use EventManagerAwareTrait;

    /**
     * @var TranslatorInterface
     */
    protected $translator;

    /**
     * @var ServiceLocatorInterface
     */
    protected $serviceLocator;

    /**
     * Get the fully qualified name of the corresponding representation class.
     *
     * @return string
     */
    abstract public function getRepresentationClass();

    public function search(Request $request)
    {
        throw new Exception\OperationNotImplementedException(sprintf(
            $this->getTranslator()->translate(
                'The %1$s adapter does not implement the search operation.'
            ),
            get_called_class()
        ));
    }

    public function create(Request $request)
    {
        throw new Exception\OperationNotImplementedException(sprintf(
            $this->getTranslator()->translate(
                'The %1$s adapter does not implement the create operation.'
            ),
            get_called_class()
        ));
    }

    public function batchCreate(Request $request)
    {
        throw new Exception\OperationNotImplementedException(sprintf(
            $this->getTranslator()->translate(
                'The %1$s adapter does not implement the batch create operation.'
            ),
            get_called_class()
        ));
    }

    public function read(Request $request)
    {
        throw new Exception\OperationNotImplementedException(sprintf(
            $this->getTranslator()->translate(
                'The %1$s adapter does not implement the read operation.'
            ),
            get_called_class()
        ));
    }

    public function update(Request $request)
    {
        throw new Exception\OperationNotImplementedException(sprintf(
            $this->getTranslator()->translate(
                'The %1$s adapter does not implement the update operation.'
            ),
            get_called_class()
        ));
    }

    public function batchUpdate(Request $request)
    {
        throw new Exception\OperationNotImplementedException(sprintf(
            $this->getTranslator()->translate(
                'The %1$s adapter does not implement the batch update operation.'
            ),
            get_called_class()
        ));
    }

    public function preprocessBatchUpdate(array $data, Request $request)
    {
        $eventManager = $this->getEventManager();
        $args = $eventManager->prepareArgs(['data' => $data, 'request' => $request]);
        $event = new Event('api.preprocess_batch_update', $this, $args);
        $eventManager->triggerEvent($event);

        // Pass the data through by default.
        return $args['data'];
    }

    public function delete(Request $request)
    {
        throw new Exception\OperationNotImplementedException(sprintf(
            $this->getTranslator()->translate(
                'The %1$s adapter does not implement the delete operation.'
            ),
            get_called_class()
        ));
    }

    public function batchDelete(Request $request)
    {
        throw new Exception\OperationNotImplementedException(sprintf(
            $this->getTranslator()->translate(
                'The %1$s adapter does not implement the batch delete operation.'
            ),
            get_called_class()
        ));
    }

    /**
     * Get an adapter by resource name.
     *
     * @param string $resourceName
     * @return AdapterInterface
     */
    public function getAdapter($resourceName)
    {
        return $this->getServiceLocator()
            ->get('Omeka\ApiAdapterManager')
            ->get($resourceName);
    }

    /**
     * Compose a resource representation object.
     *
     * @param mixed $data Whatever data is needed to compose the representation.
     * @return ResourceInterface|null
     */
    public function getRepresentation(ResourceInterface $data = null)
    {
        if (null === $data) {
            // Do not attempt to compose a null representation.
            return null;
        }
        $representationClass = $this->getRepresentationClass();
        return new $representationClass($data, $this);
    }

    /**
     * Get the translator service
     *
     * return TranslatorInterface
     */
    public function getTranslator()
    {
        if (!$this->translator instanceof TranslatorInterface) {
            $this->translator = $this->getServiceLocator()->get('MvcTranslator');
        }
        return $this->translator;
    }

    public function getResourceId()
    {
        return get_called_class();
    }

    public function setServiceLocator(ServiceLocatorInterface $serviceLocator)
    {
        $this->serviceLocator = $serviceLocator;
        $this->setEventManager($serviceLocator->get('EventManager'));
    }

    public function getServiceLocator()
    {
        return $this->serviceLocator;
    }
}
