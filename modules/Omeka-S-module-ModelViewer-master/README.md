Model viewer (module for Omeka S)
=================================

[Model viewer] is a module for [Omeka S] that integrates [three.js], a viewer
for 3D models.

A live example can be found on [PSL digital library].


Installation
------------

The module uses an external library [three.js], so use the release zip to
install it, or use and init the source. Furthermore, it is recommended to
install the modules [Bulk Edit] when your files are `gltf`, and [Xml Viewer]
when your files are Collada `dae` (see below).

* From the zip

Download the last release [ModelViewer.zip] from the list of releases (the master
does not contain the dependency), and uncompress it in the `modules` directory.

* From the source and for development:

If the module was installed from the source, rename the name of the folder of
the module to `ModelViewer`, and go to the root module, and run:

```sh
composer install --no-dev
```

Then install it like any other Omeka module.


Usage
-----

Once installed, 3D models are automatically displayed in admin and public sites.

Nevertheless, some points should be checked.

### Support

The [three.js] library supports only some 3D formats.

The recommended format is [glTF]™, the Graphics Language Transmission Format.
It's a royalty-free publishing 3D format designed for sharing and web, unlike
many other 3D formats that are designed for edition. It is supported by all
professional 3D softwares, all big companies, and all browsers. Not that only
the version 2.0 of the format is supported. The version 1.0 was based on WebGL.
Lossless conversion from version 1.0 to version 2.0 can be done with common
tools.

The glTF format has two variants: a single binary file (`.glb`) or a main json
file (`.gltf`) and related files (images, textures, etc.). The first one is
simpler to manage because the model is a single file. The second can be updated
easily, at least outside of Omeka, but is harder to manage and requires absolute
urls or module [Archive Repertory] (see below).

The internal format of threejs is supported too, but only if it is internally
based on glTF v2, so it is not recommended.

The [three.js] library included in the module doesn't include all its extensions
that can be used to manage 3D models. In particular, the draco compressor
extension is not included. It's not so important, because the files are usually
zipped by the server if you configured it so. For example, add this to your
Apache config or in the file `.htaccess` at the root of Omeka:

```htaccess
<IfModule mod_deflate.c>
    <IfModule mod_filter.c>
        AddOutputFilterByType DEFLATE text/plain text/html text/css text/javascript application/javascript application/x-javascript application/ld+json application/json text/xml application/xml model/gltf-binary model/gltf+json
    </IfModule>
</IfModule>
```

Some other formats may be supported or not: Collada (`.dae`), FilmBox (`.fbx`),
Object (`.obj`), but they were less checked.

### Cors

To share the files with other servers, the server may need to allow CORS.

### Media-types and security issue

By default, the 3D models are not allowed in the default global settings. The
module adds them during install, but if they are removed, you have to re-add
them in the admin settings:

Media-types:
```
application/octet-stream, application/vnd.threejs+json, model/gltf-binary, model/gltf+json, model/obj, model/vnd.collada+xml, model/vnd.filmbox, image/ktx2, model/mtl
```

Extensions:
```
bin, dae, fbx, glb, gltf, json, ktx2, mtl, obj
```

In some cases, if you use single file, the `.glb` files or the related `.bin`
are identified as `application/octet-stream`, that means that they are not
recognized. If you can't upload these files for security reasons (a bin file can
be a malware), you need to disable the file validation in the global settings.
Don't forget to reenable it after upload, because it is a security issue, or add
other security checks somewhere else, in particular during authentication or
with a server virus scanner (generally the [clam av] on Linux server).

### Identification of xml Collada files

Because Collada files are xml files, they are not automatically recognized by
Omeka.

To identify them, there are two solutions: use the file extension `.dae` or
install the module [Xml Viewer], that identify the xml-dae files with the vendor
media type `model/vnd.collada+xml`.

### Identification of files (json...)

In other case, you may need to update directly the media-type of each file. You
can use the module [Bulk Edit] that adds this feature in the batch edit in item/browse
and media/browse.

It is important in particular to convert the `application/json` into `model/gltf+json`.

### Size warning

It is important to warn visitors about the size of the 3D models: not everyone
has the fiber. Unlike big images that can be tiled statically or dynamically, no
3D model streaming format is supported for now and 3D models should be fully
loaded to be displayed, in particular when they are served as one binary file.

The examples below are 46 MB (Flying Helmet, [17 files], glTF) and 16 MB (The Kiss,
3 files, ThreeJs).

### Possible requirement

If your 3D models have multiple files and if they references themselves with
relative paths, another module may be needed because Omeka S hashes filenames of
all uploaded files. If your 3D models are single file (generaly binary gtLF),
the models are loaded simpler.

The module [Archive Repertory] must be installed when the json files that
represent the 3D models use files that are identified by a basename and not a
full url. This is generally the case, because the model contains external
images for textures and binary files for data. Like Omeka hashes filenames when
it ingests files, the files can’t be retrieved by the Universal Viewer.

This module is not required when there is no external images or when these
images are referenced in the json files with a full url.

***Important***: When using [Archive Repertory] and when two files have the same
base name (for example "thekiss.jpg" and "thekiss.json" below), the image, that
is referenced inside the json, must be uploaded before the json in order to keep
the original name (the json file will be renamed thekiss.1.json). The issue is
the same with gltf files: if there is a "my-object.gltf" and a "my-object.bin",
the file "my-object.bin" should be loaded before.

More generally, all files must have a different filename, excluding the
extension. So when there are more than one duplicate filename, you have to
rename all referenced filenames.

If you want another order, save the item one time with the order above, then
reorder medias and save the item.

The list of files should be flat. If the images or any other files are in a
subdirectory, for example "textures/example61_baseColor.png", you have two
possibilities:
- move all files to the root of the main file and update the main file with the
  new filenames "example61_baseColor.png",
- create the subdirectories ("textures" here) in the item directory, so "files/original/xxx/textures/",
  "files/large/xxx/textures/", "files/medium/xxx/textures/", and "files/square/xxx/textures/",
  move the files inside them, and update the value in the database, prepending
  "textures/" to the value in the column `storage id` of the table `media`.
This last point will be managed automatically in a future version of the module
[Archive Repertory].

### Thumbnail

Because 3D models are mainly data and textures, no thumbnail can be created with
standard tools (GD or Image Magick). In order to display an image in the pages
"documents browse" or "document view", a thumbnail can be added to the item.

It can be done as an asset attached to the item, that is the simpler way, or as
the first media of the item. In this second case, it should be the first media
and the original filename should be "thumb", "thumbnail", "screenshot",
"vignette", or "miniatura". The extension should be "png", "jpeg", "jpg", "gif",
or "webp". This name allows to make the distinction between the thumbnail and
the textures that belong to the item.

### Specific config

When a model doesn't contain all the required data to build a scene, in
particular the background, the controls, the lights and the camera, it is
possible to config it in a property. This property is defined main settings,
then each model can contain a specific config. The value must be a media one,
not an item one. The value should be a well formatted json, so check commas and
double quotes, or check on [JsonFormatter] or a similar site. The default data
are:

```json
{
    "background": "#363636",
    "scale": 1,
    "cameras": [
        {
            "type": "PerspectiveCamera",
            "fov": 50,
            "aspect": 1,
            "near": 0.1,
            "far": 2000,
            "position": {"x": 50, "y": 50, "z": 80},
            "lookAt": {"x": 0, "y": 0, "z": 0}
        }
    ],
    "lights": [
        {
            "type": "AmbientLight",
            "color": 16777215,
            "intensity": 0.85,
            "position": {"x": 0, "y": 50, "z": 15}
        }
    ],
    "speed": {
        "control": 0.8,
        "orbit": 0.4,
        "scroll": 0.8
    }
}
```

To add threejs specific files, you can add the key `import` + js asset type (the
directory set in asset/vendor/threejs/js) as a subkey + the name of the classes
(the filename without `.js`).

It's possible to add a texture with key "matcap_texture" and a url to an image,
or an image from the directory `asset/img/matcaps`, copied from the [Nidorx MatCap]
repository. In that case, set the full path, prepending "/modules/ModelViewer/"),
for example:

```
    "matcap_texture": "/modules/ModelViewer/asset/img/matcaps/EAEAEA_B6B6B6_CCCCCC_C4C4C4-64px.png"
```

TO use a matcap texture speeds the display, because lights are skipped.

### Examples

#### Example with glTF

With glTF, a 3D media can be a single file that contains all data, binary data
and textures, or a main file that references many other files. Of course, it is
simpler to manage only one file, but it may be not a possible choice in all
cases.

Only glTF version 2.0 is supported, so v1.0 models should be converted (this is
lossless).

##### Single binary file (glb)

With a single file, no special configuration is needed: just load it as a
standard media or url, for example "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/AntiqueCamera/glTF-Binary/AntiqueCamera.glb".

##### Multiple files (gltf)

With a multi-files media, you need to import the thumbnail first (or as asset),
then the binary file if the filename is the same than the main json file, then
the shaders and textures.

- Create a new item with the following metadata:
  - Title: Flight Helmet
  - License: Public domain
  - Add this file as thumbnail of the item: https://github.com/KhronosGroup/glTF-Sample-Models/blob/master/2.0/FlightHelmet/screenshot/screenshot.jpg
- Add all the files in the directory https://github.com/KhronosGroup/glTF-Sample-Models/tree/master/2.0/FlightHelmet/glTF,
  starting with the file "FlightHelmet.bin".
- Go to the public page of the item and watch it!

Of course, it is simpler to use a spreadsheet with modules [Bulk Import] or [CSV Import].

#### Example with a threejs file

This example requires to enable the extension and media types for json (see
above) and requires the module [Archive Repertory].

This format seems to be not really documented, but it looks like based on glTF.
For this version of ThreeJs, the files must be based on glTF v2.0, so a
conversion is required for old examples. The example below is an old example.

***IMPORTANT***: The json file in the example below is based on glTF v1.0 and
must be upgraded to a newer version in order to be displayed with the last
release of [Three JS].

- Create a new item with the following metadata:
  - Title: The Kiss
  - Date: 2015-11-27
  - Description: Soap stone statuette of Rodin’s The Kiss. Found at Snooper’s Paradise in Brighton UK.
  - Rights: 3D model produced by Sophie Dixon
  - License (or Rights): by-nc-nd
- Add the next three files (as uploaded files or as url if they are served by a
  https server), taken from the official examples:
  - http://files.universalviewer.io/manifests/foundobjects/thekiss/thumb.jpg
  - http://files.universalviewer.io/manifests/foundobjects/thekiss/thekiss.jpg
  - http://files.universalviewer.io/manifests/foundobjects/thekiss/thekiss.json
- Go to the public page of the item and watch it!

Note that the three files above should be uploaded because the server "http://files.universalviewer.io"
has an issue with its certificate.

### Display in themes

To embed the model viewer somewhere else, just use the helper:

```php
    // Display the viewer with the specified item (or media) and specified options.
    // The options for the viewer are directly passed to the partial, so they are
    // available in the theme and set for the viewer.
    echo $this->modelViewer($item, $options);
```

TODO
----

- [ ] Manage all 3D formats (in iiif [see example] or https://iiif-3d-manifests.netlify.app and in the viewer (https://github.com/edsilv/virtex/tree/master/src)).
- [ ] Store the json precise type (model/gltf+json) in media during import or via a job (see module ExtractOcr for xml).
- [ ] Manage subdirectories with module Archive Repertory.


Warning
-------

Use it at your own risk.

It’s always recommended to backup your files and your databases and to check
your archives regularly so you can roll back if needed.


Troubleshooting
---------------

See online issues on the [module issues] page on GitLab.


License
-------

### Module

This module is published under the [CeCILL v2.1] license, compatible with
[GNU/GPL] and approved by [FSF] and [OSI].

In consideration of access to the source code and the rights to copy, modify and
redistribute granted by the license, users are provided only with a limited
warranty and the software’s author, the holder of the economic rights, and the
successive licensors only have limited liability.

In this respect, the risks associated with loading, using, modifying and/or
developing or reproducing the software by the user are brought to the user’s
attention, given its Free Software status, which may make it complicated to use,
with the result that its use is reserved for developers and experienced
professionals having in-depth computer knowledge. Users are therefore encouraged
to load and test the suitability of the software as regards their requirements
in conditions enabling the security of their systems and/or data to be ensured
and, more generally, to use and operate it in the same conditions of security.
This Agreement may be freely reproduced and published, provided it is not
altered, and that no provisions are either added or removed herefrom.

### Library

The [Three JS] library is published under the [MIT licence].

The library [gsap] is included to simplify animations. The source is open and
the library is free, but the license is proprietary.

### Assets

Matcap images are free assets from the [Nidorx MatCap] repository.
Check individual licence on it.


Copyright
---------

Widget [Three JS]:

* See copyright on the site [threejs.org]

Module Model Viewer for Omeka S:

* Copyright Daniel Berthereau, 2021-2023 (see [Daniel-KM])


[Model viewer]: https://gitlab.com/Daniel-KM/Omeka-S-module-ModelViewer
[Omeka S]: https://omeka.org/s
[three.js]: https://threejs.org
[PSL digital library]: https://bibnum.explore.psl.eu/s/psl/ark:/18469/3t76z
[ModelViewer.zip]: https://gitlab.com/Daniel-KM/Omeka-S-module-ModelViewer/-/releases
[threejs]: https://threejs.org
[Three JS]: https://threejs.org
[clam av]: https://www.clamav.net
[Xml Viewer]: https://gitlab.com/Daniel-KM/Omeka-S-module-XmlViewer
[Bulk Edit]: https://gitlab.com/Daniel-KM/Omeka-S-module-BulkEdit
[17 files]: https://github.com/KhronosGroup/glTF-Sample-Models/tree/master/2.0/FlightHelmet
[glTF]: https://en.wikipedia.org/wiki/GlTF
[Archive Repertory]: https://gitlab.com/Daniel-KM/Omeka-S-module-ArchiveRepertory
[Bulk Import]: https://gitlab.com/Daniel-KM/Omeka-S-module-BulkImport
[CSV Import]: https://github.com/omeka-s-modules/CSVImport
[JsonFormatter]: https://jsonformatter.org
[see example]: https://www.morphosource.org/manifests/1fbaa268-b02f-4b46-a249-cef46bcbe04c
[module issues]: https://gitlab.com/Daniel-KM/Omeka-S-module-ModelViewer/-/issues
[CeCILL v2.1]: https://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html
[GNU/GPL]: https://www.gnu.org/licenses/gpl-3.0.html
[FSF]: https://www.fsf.org
[OSI]: http://opensource.org
[MIT licence]: https://github.com/UniversalViewer/universalviewer/blob/master/LICENSE.txt
[threejs.org]: https://threejs.org
[gsap]: https://greensock.com/gsap
[Nidorx MatCap]: https://github.com/nidorx/matcaps
[Daniel-KM]: https://gitlab.com/Daniel-KM "Daniel Berthereau"
