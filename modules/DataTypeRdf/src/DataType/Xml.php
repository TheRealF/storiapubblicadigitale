<?php declare(strict_types=1);

namespace DataTypeRdf\DataType;

use Laminas\Form\Element;
use Laminas\View\Renderer\PhpRenderer;
use Omeka\Api\Adapter\AbstractEntityAdapter;
use Omeka\Api\Representation\ValueRepresentation;
use Omeka\Entity\Value;

/**
 * @link https://www.w3.org/TR/rdf11-concepts/#section-XMLLiteral
 */
class Xml extends AbstractDataTypeRdf
{
    public function getName()
    {
        return 'xml';
    }

    public function getLabel()
    {
        return 'Xml';
    }

    public function prepareForm(PhpRenderer $view): void
    {
        $plugins = $view->getHelperPluginManager();
        $assetUrl = $plugins->get('assetUrl');

        $view->headLink()
            ->appendStylesheet($assetUrl('vendor/codemirror/lib/codemirror.css', 'DataTypeRdf'))
            ->appendStylesheet($assetUrl('vendor/codemirror/addon/hint/show-hint.css', 'DataTypeRdf'));
        $view->headScript()
            ->appendFile($assetUrl('vendor/codemirror/lib/codemirror.js', 'DataTypeRdf'))
            ->appendFile($assetUrl('vendor/codemirror/addon/display/placeholder.js', 'DataTypeRdf'))
            // Required in resource form.
            ->appendFile($assetUrl('vendor/codemirror/addon/display/autorefresh.js', 'DataTypeRdf'))
            ->appendFile($assetUrl('vendor/codemirror/addon/hint/show-hint.js', 'DataTypeRdf'))
            ->appendFile($assetUrl('vendor/codemirror/addon/hint/xml-hint.js', 'DataTypeRdf'))
            ->appendFile($assetUrl('vendor/codemirror/mode/xml/xml.js', 'DataTypeRdf'))
            ->appendFile($assetUrl('js/data-type-rdf.js', 'DataTypeRdf'), 'text/javascript', ['defer' => 'defer']);
    }

    public function form(PhpRenderer $view)
    {
        $element = new Element\Textarea('xml');
        $element->setAttributes([
            'class' => 'value to-require xml xml-edit',
            'data-value-key' => '@value',
            /*
            'placeholder' => '<oai_dcterms:dcterms>
    <dcterms:title>Resource Description Framework (RDF)</dcterms:title>
</oai_dcterms:dcterms>',
            */
        ]);
        return $view->formTextarea($element);
    }

    public function isValid(array $valueObject)
    {
        // TODO Check validity of xml.
        return isset($valueObject['@value']);
    }

    public function hydrate(array $valueObject, Value $value, AbstractEntityAdapter $adapter): void
    {
        $value->setValue(trim((string) $valueObject['@value']));
        // Set defaults.
        // According to the recommandation, the language must be included
        // explicitly in the XML literal.
        // TODO Manage the language for xml.
        $value->setLang(null);
        $value->setUri(null);
        $value->setValueResource(null);
    }

    public function render(PhpRenderer $view, ValueRepresentation $value, $options = [])
    {
        $options = (array) $options;
        return empty($options['raw'])
            ? (string) $value->value()
            : $view->escapeHtml($value->value());
    }

    public function getFulltextText(PhpRenderer $view, ValueRepresentation $value)
    {
        return strip_tags((string) $value->value());
    }

    public function getJsonLd(ValueRepresentation $value)
    {
        $jsonLd = [
            '@value' => $value->value(),
            '@type' => 'http://www.w3.org/1999/02/22-rdf-syntax-ns#XMLLiteral',
        ];
        $lang = $value->lang();
        if ($lang) {
            $jsonLd['@language'] = $lang;
        }
        return $jsonLd;
    }
}
