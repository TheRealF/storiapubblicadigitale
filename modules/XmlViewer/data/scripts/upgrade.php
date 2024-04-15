<?php declare(strict_types=1);

namespace XmlViewer;

use Omeka\Stdlib\Message;

/**
 * @var Module $this
 * @var \Laminas\ServiceManager\ServiceLocatorInterface $services
 * @var string $newVersion
 * @var string $oldVersion
 *
 * @var \Omeka\Api\Manager $api
 * @var \Omeka\Settings\Settings $settings
 * @var \Doctrine\DBAL\Connection $connection
 * @var \Doctrine\ORM\EntityManager $entityManager
 * @var \Omeka\Mvc\Controller\Plugin\Messenger $messenger
 */
$plugins = $services->get('ControllerPluginManager');
$api = $plugins->get('api');
$settings = $services->get('Omeka\Settings');
$translate = $plugins->get('translate');
$connection = $services->get('Omeka\Connection');
$messenger = $plugins->get('messenger');
$entityManager = $services->get('Omeka\EntityManager');

if (!method_exists($this, 'checkModuleActiveVersion') || !$this->checkModuleActiveVersion('Common', '3.4.54')) {
    $message = new Message(
        $translate('The module %1$s should be upgraded to version %2$s or later.'), // @translate
        'Common', '3.4.54'
    );
    throw new \Omeka\Module\Exception\ModuleCannotInstallException((string) $message);
}

if (version_compare($oldVersion, '3.3.0.5', '<')) {
    $renderings = $settings->get('xmlviewer_renderings') ?: [];
    if (!isset($renderings['application/alto+xml'])) {
        $renderings['application/alto+xml'] = 'xsl/xml-alto-html.xslt';
    }
    $settings->set('xmlviewer_renderings', $renderings);

    $siteIds = $api->search('sites', [], ['initialize' => false, 'returnScalar' => 'id'])->getContent();
    /** @var \Omeka\Settings\SiteSettings $siteSettings */
    $siteSettings = $services->get('Omeka\Settings\Site');
    foreach ($siteIds as $siteId) {
        $siteSettings->setTargetId($siteId);
        $renderings = $siteSettings->get('xmlviewer_renderings') ?: [];
        if (isset($renderings['application/alto+xml'])) {
            continue;
        }
        $renderings['application/alto+xml'] = 'xsl/xml-alto-html.xslt';
        $siteSettings->set('xmlviewer_renderings', $renderings);
    }
}
