<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit6087f0ed0aa2d891da0526906cac7f3d
{
    public static $prefixLengthsPsr4 = array (
        'B' => 
        array (
            'BulkEdit\\' => 9,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'BulkEdit\\' => 
        array (
            0 => __DIR__ . '/../..' . '/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit6087f0ed0aa2d891da0526906cac7f3d::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit6087f0ed0aa2d891da0526906cac7f3d::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit6087f0ed0aa2d891da0526906cac7f3d::$classMap;

        }, null, ClassLoader::class);
    }
}