<?php
namespace Omeka\View\Helper;

use Omeka\Form\Element\ResourceClassSelect as Select;
use Laminas\Form\Factory;
use Laminas\View\Helper\AbstractHelper;
use Laminas\ServiceManager\ServiceLocatorInterface;

/**
 * View helper for rendering a select menu containing all resource classes.
 */
class ResourceClassSelect extends AbstractHelper
{
    /**
     * @var ServiceLocatorInterface
     */
    protected $formElementManager;

    /**
     * Construct the helper.
     *
     * @param ServiceLocatorInterface $formElementManager
     */
    public function __construct(ServiceLocatorInterface $formElementManager)
    {
        $this->formElementManager = $formElementManager;
    }

    /**
     * Render a select menu containing all resource classes.
     *
     * @param array $spec
     * @return string
     */
    public function __invoke(array $spec = [])
    {
        $spec['type'] = Select::class;
        if (!isset($spec['options']['empty_option'])) {
            $spec['options']['empty_option'] = 'Select class…'; // @translate
        }
        $factory = new Factory($this->formElementManager);
        $element = $factory->createElement($spec);
        return $this->getView()->formSelect($element);
    }
}
