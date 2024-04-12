<?php
namespace Omeka\Api\Representation;

class PropertyRepresentation extends AbstractVocabularyMemberRepresentation
{
    public function getControllerName()
    {
        return 'property';
    }

    public function getJsonLdType()
    {
        return 'o:Property';
    }

    /**
     * Get the resource count of this property.
     *
     * @return int
     */
    public function itemCount()
    {
        $response = $this->getServiceLocator()->get('Omeka\ApiManager')
            ->search('items', [
                'property' => [
                    [
                        'property' => $this->id(),
                        'type' => 'ex',
                    ],
                ],
                'limit' => 0,
            ]);
        return $response->getTotalResults();
    }
}
