<?php declare(strict_types=1);

/*
 * Copyright 2021 Daniel Berthereau
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

namespace ModelViewer;

if (!class_exists(\Generic\AbstractModule::class)) {
    require file_exists(dirname(__DIR__) . '/Generic/AbstractModule.php')
        ? dirname(__DIR__) . '/Generic/AbstractModule.php'
        : __DIR__ . '/src/Generic/AbstractModule.php';
}

use Generic\AbstractModule;
use Laminas\EventManager\SharedEventManagerInterface;
use Omeka\Module\Exception\ModuleCannotInstallException;
use Omeka\Stdlib\Message;

class Module extends AbstractModule
{
    const NAMESPACE = __NAMESPACE__;

    protected function preInstall(): void
    {
        $services = $this->getServiceLocator();
        $t = $services->get('MvcTranslator');

        $js = __DIR__ . '/asset/vendor/threejs/three.min.js';
        if (!file_exists($js)) {
            throw new ModuleCannotInstallException(
                sprintf(
                    $t->translate('The library "%s" should be installed.'), // @translate
                    'Three Js'
                ) . ' '
                . $t->translate('See module’s installation documentation.')); // @translate
        }

        $messenger = $services->get('ControllerPluginManager')->get('messenger');
        $message = new Message(
            'If your json and xml files are not recognized as model, install modules Bulk Edit and/or Xml Viewer.' // @translate
                . ' ' . $t->translate('See module’s installation documentation.') // @translate
        );
        $messenger->addWarning($message);
    }

    protected function postInstall(): void
    {
        $this->updateWhitelist();
    }

    public function attachListeners(SharedEventManagerInterface $sharedEventManager): void
    {
        $sharedEventManager->attach(
            \Omeka\Form\SettingForm::class,
            'form.add_elements',
            [$this, 'handleMainSettings']
        );
    }

    protected function updateWhitelist(): void
    {
        $settings = $this->getServiceLocator()->get('Omeka\Settings');

        $whitelist = $settings->get('media_type_whitelist', []);
        $whitelist = array_values(array_unique(array_merge(array_values($whitelist), [
            'application/octet-stream',
            'application/vnd.threejs+json',
            'model/gltf-binary',
            'model/gltf+json',
            'model/obj',
            'model/vnd.collada+xml',
            'model/vnd.filmbox',
            // TODO Add all media types supported by three js.
            // Associated files for models.
            'image/ktx2',
            'model/mtl',
        ])));
        $settings->set('media_type_whitelist', $whitelist);

        $whitelist = $settings->get('extension_whitelist', []);
        $whitelist = array_values(array_unique(array_merge(array_values($whitelist), [
            'bin',
            'dae',
            'fbx',
            'glb',
            'gltf',
            'json',
            'ktx2',
            // Extensions for associated files.
            'mtl',
            'obj',
        ])));
        $settings->set('extension_whitelist', $whitelist);
    }
}
