<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit24366ce115e19251cb81662b8fa61d4e
{
    public static $prefixLengthsPsr4 = array (
        'T' => 
        array (
            'Tests\\PhpOffice\\Math\\' => 21,
        ),
        'P' => 
        array (
            'PhpOffice\\PhpWord\\' => 18,
            'PhpOffice\\Math\\' => 15,
        ),
        'O' => 
        array (
            'OpenSpout\\' => 10,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Tests\\PhpOffice\\Math\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpoffice/math/tests/Math',
        ),
        'PhpOffice\\PhpWord\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpoffice/phpword/src/PhpWord',
        ),
        'PhpOffice\\Math\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpoffice/math/src/Math',
        ),
        'OpenSpout\\' => 
        array (
            0 => __DIR__ . '/..' . '/openspout/openspout/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit24366ce115e19251cb81662b8fa61d4e::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit24366ce115e19251cb81662b8fa61d4e::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit24366ce115e19251cb81662b8fa61d4e::$classMap;

        }, null, ClassLoader::class);
    }
}
