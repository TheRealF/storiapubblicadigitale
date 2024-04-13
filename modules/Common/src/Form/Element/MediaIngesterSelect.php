<?php declare(strict_types=1);

namespace Common\Form\Element;

use Laminas\Form\Element\Select;

class MediaIngesterSelect extends Select
{
    use TraitOptionalElement;
    use TraitPrependValuesOptions;
}
