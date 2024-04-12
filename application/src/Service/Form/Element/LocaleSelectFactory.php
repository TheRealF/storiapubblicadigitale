<?php
namespace Omeka\Service\Form\Element;

use Interop\Container\ContainerInterface;
use Laminas\Form\Element\Select;
use Laminas\ServiceManager\Factory\FactoryInterface;

class LocaleSelectFactory implements FactoryInterface
{
    protected $services;
    protected $intlLoaded;

    public function __invoke(ContainerInterface $services, $requestedName, array $options = null)
    {
        $this->services = $services;
        $this->intlLoaded = extension_loaded('intl');

        $locales = ['en_US' => $this->getValueOption('en_US')];
        $dir = sprintf('%s/application/language', OMEKA_PATH);
        foreach (new \DirectoryIterator($dir) as $fileinfo) {
            if ($fileinfo->isFile() && 'mo' === $fileinfo->getExtension()) {
                $localeId = $fileinfo->getBasename('.mo');
                $locales[$localeId] = $this->getValueOption($localeId);
            }
        }

        if ($this->intlLoaded) {
            $collator = new \Collator("root");
            $collator->asort($locales);
        } else {
            natcasesort($locales);
        }

        $element = new Select;
        $element->setValueOptions($locales);
        $element->setEmptyOption('Default'); // @translate
        return $element;
    }

    public function getValueOption($localeId)
    {
        $localeName = $this->intlLoaded
            ? \Locale::getDisplayName($localeId, $localeId)
            : $localeId;
        if ($localeId !== $localeName) {
            $localeName = mb_convert_case($localeName, MB_CASE_TITLE, 'UTF-8');
            $localeName = sprintf('%s [%s]', $localeName, $localeId);
        }
        return $localeName;
    }
}
