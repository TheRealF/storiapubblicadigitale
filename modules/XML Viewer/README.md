XML Viewer (module for Omeka S)
===============================

> __New versions of this module and support for Omeka S version 3.0 and above
> are available on [GitLab], which seems to respect users and privacy better
> than the previous repository.__

[XML Viewer] is a module for [Omeka S] that integrates a simple viewer for XML.
Currently, only a generic format, [Alto] and the TEI are available by default.

In practice, the xml is converted into html via a xslt stylesheet and displayed
through an iframe. The rendering can use a css stylesheet too.

Alto is a standard format used to store text from scanned objects.

TEI is the Text Encoding Initiative, a standard used for the representation of
the manuscripts and any other texts in a digital format. It uses the html/css/js/xsl
of [Œuvre/Teinte].


Installation
------------

See general end user documentation for [installing a module].

The module [Common] must be installed first.

The module uses an external library, [Œuvre/Teinte], so use the release zip to
install it, or use and init the source.

The `php-xsl` extension must be available, but it's by default in most linux
distribution since a while.

* From the zip

Download the last release [XmlViewer.zip] from the list of releases (the master
does not contain the dependency), and uncompress it in the `modules` directory.

* From the source and for development:

If the module was installed from the source, rename the name of the folder of
the module to `XmlViewer`, and go to the root module, and run:

```sh
composer install --no-dev
```

Then install it like any other Omeka module and follow the config instructions.


Usage
-----

It is useless to display many xml contents, so by default, no xml content is
displayed, only the link.

### Set the rendering for each media-type

To display a xml content, you have to specify them in the main settings (for
admin board) and in site settings (for public front-end), even for the default
xml media-types `text/xml` and `application/xml`.

The text area in the settings allows to list the media-types to display. Set
one media-type by line and set the type of rendering after an `=`. The type may
be:

- a xsl or a css stylesheet. It can be a full url or an asset one, for example
  `xsl/xml-html.xslt` or `vendor/teinte/tei2html.xsl`. The asset stylesheets can
  be modified through the theme. Multiple xsl and css stylesheets can be set,
  separated by a `|`. Anyway, they can be included indirectly via the css `@import`,
  the xsl stylesheet itself, or via the xsl output.
- a string among:
  - `text`: render the xml as pure text;
  - `no` or `false`: skip the xml;
  - `original`: render original files, so they should contain a link to a xsl
  that converts the xml into an html or xhtml or something renderable in an
  iframe.

The xml files whose media-type is not listed are rendered as a fallback download
link.

Some browsers manage xsl stylesheets differently in an iframe or in full page.
For example, with Chrome, a stylesheet at the end of an xml file works in a
iframe, but not in full page.

The most common browsers manage only xslt v1.0.

In all cases, the media-type should be allowed.

### Override the config

The css/xsl stylesheets are stored in the asset directory, so they can be
overridden by any file with the same path in the theme.

Furthermore, they may be overridden directly with an argument `render` in the url:
https://example.org/s/my-site/xml/1?render=xsl/specific-xsl.xsl.

In the theme, the rendering can be done like that:

```php
echo $xmlMedia->render(['url' => ['render' => 'xsl/my-specific.xsl']]);
```

### Security

When external urls are used instead of assets, some security points should be
checked.

#### https/https

Browsers forbid usage of unsecure iframe (`http`) on a secure page (`https`). If
you really need to use a `http` stylesheet, turn your server on `http`.

A future development will allow a server rendering to fix this issue. Anyway,
every site should be https nowadays.

#### Cors

***Warning***: Cross-origin resource sharing (CORS) issues may occur when the
domains are different between the iframe and the Omeka page, even when they are
all `https`. Check if the urls of the remote domains are allowed on the local
site.

### XML media-type

The media-type is the short string like `type/subtype` that identify the type of
a file from its real content, not from the extension (as in Apple/Windows). It
is managed by the Internet Assigned Numbers Authority (IANA) and it is a
generalisation of the old mime-types (Multipurpose Internet Mail Extensions),
that was designed to identify files attached to mails. Nowaday, it's
standardized in the RFC 6838 of IETF.

For XML, Omeka considers that all imported xml files as `application/xml` or
`text/xml`, depending on the server. But the main xml formats use a more precise
value, for example `application/tei+xml` for TEI, or `application/vnd.mei+xml`
for XML-MEI, or `application/mets+xml` for METS, or `image/svg+xml` for SVG.
There may be old values too. For example, the value for TEI before 2011 was
`application/vnd.tei+xml`, because it wasn't registered in the [iana list].

Furthermore, some xml files may be zipped, like the Open Document one (first
official standard office documents used by LibreOffice and many other office
suites), or MusicXML `application/vnd.recordare.musicxml`. They may be
identified by the server and Omeka as zip `application/zip`, but they are mainly
XML files. And MusicXML has a offical second media-type in fact when not zipped,
`application/vnd.recordare.musicxml+xml`.

Normally, new files will have the right media-type if it is managed: see the
list in the file [data/media-types/media-type-identifiers.php] that is used to
identify them.

To normalize old files or other formats, you need the module [Bulk Edit] and to
use the batch edit feature in item/browse and media/browse.

### Rendering

If you want to modify the rendering, update the xsl or the css in the view
assets or override them with the theme.

You can update the list of the xml media-types too in the file `data/media-types/media-type-identifiers.php`.

### Specific xml types

Some modules provide a specific viewer for some xml files.

### Alto

The module [Extract Text] can extract the raw text and store it in a property of
the item and the media. The content is displayed as a simple text currently.

#### MusicXML and XML-MEI

There is a special module for MusicXml and XML-MEI, [Verovio], that render the
xml files with a score player.

#### Office Open Documents (spreadsheet ods/fods, text odt/fodt, presentation odp/fodp)

The module [ViewerJS] can display them.

#### Collada models

The module [Model Viewer] can display them.

### Issue with XML parsing and display error

In some cases, the server or the browser are too quick or too slow to answer and
the server may append a message like "session_write_close(): Failed to write session data using user defined save handler."
to the xml output, so xsl won't be able to convert it, and the browser display
an error like "XML Parsing Error: junk after document element".

In that case, put your Omeka server in production mode (`SetEnv APPLICATION_ENV "production"`
in file `.htaccess`). Else disable `display_error` in your php config (file
`php.ini` on your server, or with `php_flag display_startup_errors off` in `.htaccess`.
Else (not recommended) add a `@` before `session_write_close();` line 235 of [`vendor/laminas/laminas-session/src/SessionManager.php`].


TODO
----

- [ ] Server rendering (convert the xml to xhtml through the xsl).
- [ ] Better fix for session_write_close().


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

[Œuvre/Teinte] is published under [LGPL].


Copyright
---------

[Œuvre/Teinte]:

* Copyright 2005-2021, ajlsm.com, cyberthèses, Fréderic Glorieux & al. (see files).

Module [Xml Viewer] for Omeka S:

* Copyright Daniel Berthereau, 2019-2023

First version of this module was built for the future digital library of [Association Valentin Haüy],
with the help of the Observatoire des textes, des idées et des corpus [OBTIC] of
[Sorbonne Université]. Some code was integrated from the module [Next].


[XML Viewer]: https://gitlab.com/Daniel-KM/Omeka-S-module-XmlViewer
[Œuvre/Teinte]: https://github.com/oeuvres/teinte
[Omeka S]: https://omeka.org/s
[XmlViewer.zip]: https://gitlab.com/Daniel-KM/Omeka-S-module-XmlViewer/-/releases
[installing a module]: https://omeka.org/s/docs/user-manual/modules/#installing-modules
[Generic]: https://gitlab.com/Daniel-KM/Omeka-S-module-Generic
[module issues]: https://gitlab.com/Daniel-KM/Omeka-S-module-XmlViewer/-/issues
[Alto]: https://www.loc.gov/standards/alto
[Extract Text]: https://github.com/omeka-s-modules/ExtractText
[Verovio Viewer]: https://gitlab.com/Daniel-KM/Omeka-S-module-Verovio
[Bulk Edit]: https://gitlab.com/Daniel-KM/Omeka-S-module-BulkEdit
[Next]: https://gitlab.com/Daniel-KM/Omeka-S-module-Next
[data/media-types/media-type-identifiers.php]: https://gitlab.com/Daniel-KM/Omeka-S-module-XmlViewer/-/blob/master/data/media-types/media-type-identifiers.php
[iana list]: https://www.iana.org/assignments/media-types/media-types.xhtml
[Verovio]: https://gitlab.com/Daniel-KM/Omeka-S-module-Verovio
[ViewerJs]: https://gitlab.com/Daniel-KM/Omeka-S-module-ViewerJs
[Model Viewer]: https://gitlab.com/Daniel-KM/Omeka-S-module-ModelViewer
[vendor/laminas/laminas-session/src/SessionManager.php]: https://github.com/laminas/laminas-session/blob/2.13.x/src/SessionManager.php#L240
[CeCILL v2.1]: https://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html
[GNU/GPL]: https://www.gnu.org/licenses/gpl-3.0.html
[FSF]: https://www.fsf.org
[OSI]: http://opensource.org
[LGPL]: http://www.gnu.org/licenses/lgpl.html
[GitLab]: https://gitlab.com/Daniel-KM
[Association Valentin Haüy]: https://avh.asso.fr
[OBTIC]: https://obtic.sorbonne-universite.fr
[Sorbonne Université]: https://www.sorbonne-universite.fr
[Daniel-KM]: https://gitlab.com/Daniel-KM "Daniel Berthereau"
