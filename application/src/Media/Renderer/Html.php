<?php
namespace Omeka\Media\Renderer;

use Omeka\Api\Representation\MediaRepresentation;
use Laminas\View\Renderer\PhpRenderer;

class Html implements RendererInterface
{
    public function render(PhpRenderer $view, MediaRepresentation $media,
        array $options = []
    ) {
        $data = $media->mediaData();
        return $data['html'];
    }
}
