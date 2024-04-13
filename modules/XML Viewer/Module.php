<?php declare(strict_types=1);
/**
 * @author Daniel Berthereau
 * @license http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.txt
 * @copyright Daniel Berthereau, 2018-2024
 *
 * Copyright 2018-2024 Daniel Berthereau
 *
 * This software is governed by the CeCILL license under French law and abiding
 * by the rules of distribution of free software. You can use, modify and/or
 * redistribute the software under the terms of the CeCILL license as circulated
 * by CEA, CNRS and INRIA at the following URL "http://www.cecill.info".
 *
 * As a counterpart to the access to the source code and rights to copy, modify
 * and redistribute granted by the license, users are provided only with a
 * limited warranty and the software’s author, the holder of the economic
 * rights, and the successive licensors have only limited liability.
 *
 * In this respect, the user’s attention is drawn to the risks associated with
 * loading, using, modifying and/or developing or reproducing the software by
 * the user in light of its specific status of free software, that may mean that
 * it is complicated to manipulate, and that also therefore means that it is
 * reserved for developers and experienced professionals having in-depth
 * computer knowledge. Users are therefore encouraged to load and test the
 * software’s suitability as regards their requirements in conditions enabling
 * the security of their systems and/or data to be ensured and, more generally,
 * to use and operate it in the same conditions as regards security.
 *
 * The fact that you are presently reading this means that you have had
 * knowledge of the CeCILL license and that you accept its terms.
 */
namespace XmlViewer;

if (!class_exists(\Common\TraitModule::class)) {
    require_once dirname(__DIR__) . '/Common/TraitModule.php';
}

use Common\Stdlib\PsrMessage;
use Common\TraitModule;
use Laminas\EventManager\SharedEventManagerInterface;
use Laminas\Mvc\MvcEvent;
use Omeka\Module\AbstractModule;
use Omeka\Module\Exception\ModuleCannotInstallException;

/**
 * Xml Viewer
 *
 * @copyright Daniel Berthereau, 2018-2024
 * @license http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.txt
 */
class Module extends AbstractModule
{
    use TraitModule;

    const NAMESPACE = __NAMESPACE__;

    public function onBootstrap(MvcEvent $event): void
    {
        parent::onBootstrap($event);
        $this->addAclRules();
    }

    protected function preInstall(): void
    {
        $services = $this->getServiceLocator();
        $translate = $services->get('ControllerPluginManager')->get('translate');

        if (!method_exists($this, 'checkModuleActiveVersion') || !$this->checkModuleActiveVersion('Common', '3.4.54')) {
            $message = new \Omeka\Stdlib\Message(
                $translate('The module %1$s should be upgraded to version %2$s or later.'), // @translate
                'Common', '3.4.54'
            );
            throw new \Omeka\Module\Exception\ModuleCannotInstallException((string) $message);
        }

        // Check if xml and xslt reader are available.
        if (!class_exists('XSLTProcessor')) {
            throw new ModuleCannotInstallException(
                $translate('The module requires the php extension "xsl".') // @translate
                    . ' ' . $translate('See module’s installation documentation.') // @translate
            );
        }
    }

    protected function postInstall(): void
    {
        $this->updateWhitelist();

        $messenger = $this->getServiceLocator()->get('ControllerPluginManager')->get('messenger');
        $message = new PsrMessage(
            'To render xml, map each specific xml media-type with a css or xsl in settings and site settings.' // @translate
        );
        $messenger->addSuccess($message);

        if ($this->isModuleActive('BulkEdit')) {
            $message = new PsrMessage(
                'To specify a precise xml media-type, for example "application/tei+xml" instead of "application/xml", batch edit them.' // @translate
            );
        } else {
            $message = new PsrMessage(
                'To specify a precise xml media-type, for example "application/tei+xml" instead of "application/xml", batch edit them with module {link}Bulk Edit{link_end}.', // @translate
                [
                    'link' => '<a href="https://gitlab.com/Daniel-KM/Omeka-S-module-BulkEdit">',
                    'link_end' => '</a>',
                ]
            );
            $message->setEscapeHtml(false);
        }
        $messenger->addWarning($message);
    }

    protected function addAclRules(): void
    {
        /*
         * @var \Omeka\Permissions\Acl $acl
         * @see \Omeka\Service\AclFactory
         */
        $this->getServiceLocator()->get('Omeka\Acl')
            // Everybody can view a xml.
            ->allow(
                null,
                [
                    Controller\IndexController::class,
                ]
            );
    }

    public function attachListeners(SharedEventManagerInterface $sharedEventManager): void
    {
        $sharedEventManager->attach(
            \Omeka\Form\SettingForm::class,
            'form.add_elements',
            [$this, 'handleMainSettings']
        );
        $sharedEventManager->attach(
            \Omeka\Form\SiteSettingsForm::class,
            'form.add_elements',
            [$this, 'handleSiteSettings']
        );
    }

    protected function updateWhitelist(): void
    {
        $settings = $this->getServiceLocator()->get('Omeka\Settings');

        $whitelist = $settings->get('media_type_whitelist', []);
        $mediaTypes = require __DIR__ . '/data/media-types/media-type-identifiers.php';
        // Manage an exception.
        $mediaTypes[] = 'application/vnd.recordare.musicxml';
        sort($mediaTypes);
        $whitelist = array_values(array_unique(array_merge(array_values($whitelist), $mediaTypes)));
        $settings->set('media_type_whitelist', $whitelist);

        $whitelist = $settings->get('extension_whitelist', []);
        $extensions = require __DIR__ . '/data/media-types/media-type-extensions.php';
        sort($extensions);
        $whitelist = array_values(array_unique(array_merge(array_values($whitelist), $extensions)));
        $settings->set('extension_whitelist', $whitelist);
    }
}
