<?php
/**
 * update-db-data-module.php
 *
 * Generate Doctrine proxies for a module and dump the SQL needed to create its tables.
 */
use Doctrine\ORM\Mapping\ClassMetadata;
use Doctrine\ORM\Tools\SchemaTool;

if (!isset($argv[1])) {
    echo "Usage: php update-db-data-module.php <module name>\n";
    echo "A module name must be passed.\n";
    exit(1);
}

$moduleName = $argv[1];

if (preg_match('/[^a-zA-Z0-9]/', $moduleName)) {
    echo "Module names must be alphanumeric only.\n";
    exit(1);
}

require dirname(dirname(dirname(__DIR__))) . '/bootstrap.php';

$modulePath = implode(DIRECTORY_SEPARATOR, [OMEKA_PATH, 'modules', $moduleName]);

if (!is_dir($modulePath)) {
    echo "The module $moduleName doesn't exist!\n";
    exit(1);
}

// Initialize the Omeka application using the test database.
$config = require OMEKA_PATH . '/application/config/application.config.php';
$config['modules'][] = $moduleName;
$application = Laminas\Mvc\Application::init($config);

$entityManager = $application->getServiceManager()->get('Omeka\EntityManager');

$classMetadatas = $entityManager->getMetadataFactory()->getAllMetadata();
$moduleClassMetadatas = [];
$moduleTables = [];
foreach ($classMetadatas as $classMetadata) {
    $fileName = $classMetadata->getReflectionClass()->getFileName();
    if (strncmp($fileName, $modulePath, strlen($modulePath)) === 0) {
        $moduleClassMetadatas[] = $classMetadata;

        // Gather "main" table and any owned many-to-many tables for each file
        $moduleTables[] = $classMetadata->getTableName();
        foreach ($classMetadata->associationMappings as $mapping) {
            if ($mapping['type'] == ClassMetadata::MANY_TO_MANY && $mapping['isOwningSide']) {
                $moduleTables[] = $mapping['joinTable']['name'];
            }
        }
    }
}

if (!$moduleClassMetadatas) {
    echo "There are no database entities for the $moduleName module.";
    exit;
}

$dest = implode(DIRECTORY_SEPARATOR, [$modulePath, 'data', 'doctrine-proxies']);
if (!file_exists($dest)) {
    if (!mkdir($dest, 0755, true)) {
        echo "Couldn't create a directory at $dest!\n";
        exit(1);
    }
}

if (!is_dir($dest)) {
    echo "$dest exists, but isn't a directory!\n";
    exit(1);
}

$entityManager->getProxyFactory()->generateProxyClasses($moduleClassMetadatas, $dest);

echo "Proxies created at $dest.\n";

$schemaTool = new SchemaTool($entityManager);
$schema = $schemaTool->getSchemaFromMetadata($classMetadatas);

// We have to give the SchemaTool the core entities also, or it won't create
// references from the module entities to the core entities. To get only
// the SQL we actually want, we drop all the tables that aren't coming from
// the module before we get the SQL.
foreach ($schema->getTables() as $table) {
    foreach ($moduleTables as $tableName) {
        if ($table->getName() === $tableName) {
            continue 2;
        }
    }
    $schema->dropTable($table->getName());
}
$statements = $schema->toSql($entityManager->getConnection()->getDatabasePlatform());
$statements[] = '';

echo "SQL:\n\n" . implode(';' . PHP_EOL, $statements);
