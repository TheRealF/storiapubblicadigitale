<?php
namespace CSVImport\Mapping;

use Laminas\ServiceManager\ServiceLocatorInterface;
use Laminas\View\Renderer\PhpRenderer;

interface MappingInterface
{
    /**
     * Return a label for the button on the column mapping form
     *
     * @return string
     */
    public function getLabel();

    /**
     * Return a name to use in the form to identify this mapping's components
     *
     * @return string
     */
    public function getName();

    /**
     * Return the HTML for the sidebar for setting mappings
     * Must be a <div id='$name' class='sidebar'>
     *
     * @param PHPRenderer $view
     * @return string
     */
    public function getSidebar(PhpRenderer $view);

    /**
     * Define if the current row has an error.
     *
     * @return bool
     */
    public function getHasErr();

    /**
     * Prepare for the mapping process.
     *
     * @param array $args
     * @param ServiceLocatorInterface $serviceLocator
     */
    public function init(array $args, ServiceLocatorInterface $serviceLocator);

    /**
     * Process a row from the CSV file.
     *
     * Note: the empty values should be set too in the returned data in order to
     * manage some updates.
     *
     * @param array $row
     * @return array $entityJson including the added data
     */
    public function processRow(array $row);
}
