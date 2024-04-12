<?php

declare(strict_types=1);

namespace Laminas\Mvc\Plugin\FlashMessenger\View\Helper;

use Laminas\Mvc\Plugin\FlashMessenger\FlashMessenger as PluginFlashMessenger;
use Laminas\View\Exception\InvalidArgumentException;
use Laminas\View\Helper\AbstractHelper;
use Laminas\View\Helper\EscapeHtml;
use Laminas\View\Helper\TranslatorAwareTrait;

use function array_walk_recursive;
use function assert;
use function call_user_func_array;
use function get_class;
use function gettype;
use function implode;
use function is_object;
use function method_exists;
use function sprintf;

/**
 * Helper to proxy the plugin flash messenger
 * Duck-types against Laminas\I18n\Translator\TranslatorAwareInterface.
 *
 * @method PluginFlashMessenger addMessage(string $string)
 * @method PluginFlashMessenger addInfoMessage(string $string)
 * @method PluginFlashMessenger addSuccessMessage(string $string)
 * @method PluginFlashMessenger addErrorMessage(string $string)
 * @method PluginFlashMessenger addWarningMessage(string $string)
 * @method bool hasMessages(?string $namespace = null)
 * @method bool hasInfoMessages()
 * @method bool hasSuccessMessages()
 * @method bool hasErrorMessages()
 * @method bool hasWarningMessages()
 * @method bool hasCurrentMessages(?string $namespace = null)
 * @method bool hasCurrentInfoMessages()
 * @method bool hasCurrentSuccessMessages()
 * @method bool hasCurrentErrorMessages()
 * @method bool hasCurrentWarningMessages()
 */
class FlashMessenger extends AbstractHelper
{
    use TranslatorAwareTrait;

    /**
     * Default attributes for the open format tag
     *
     * @var array<string, string>
     */
    protected $classMessages = [
        'info'    => PluginFlashMessenger::NAMESPACE_INFO,
        'error'   => PluginFlashMessenger::NAMESPACE_ERROR,
        'success' => PluginFlashMessenger::NAMESPACE_SUCCESS,
        'default' => PluginFlashMessenger::NAMESPACE_DEFAULT,
        'warning' => PluginFlashMessenger::NAMESPACE_WARNING,
    ];

    /**
     * Templates for the open/close/separators for message tags
     *
     * @var string
     */
    protected $messageCloseString = '</li></ul>';
    /** @var string */
    protected $messageOpenFormat = '<ul%s><li>';
    /** @var string */
    protected $messageSeparatorString = '</li><li>';

    /**
     * Flag whether to escape messages
     *
     * @var bool
     */
    protected $autoEscape = true;

    /**
     * Html escape helper
     *
     * @var EscapeHtml|null
     */
    protected $escapeHtmlHelper;

    /**
     * Flash messenger plugin
     *
     * @var PluginFlashMessenger|null
     */
    protected $pluginFlashMessenger;

    /**
     * Returns the flash messenger plugin controller
     *
     * @param  string|null $namespace
     * @return FlashMessenger|PluginFlashMessenger|array<array-key, string>
     */
    public function __invoke($namespace = null)
    {
        if (null === $namespace) {
            return $this;
        }
        $flashMessenger = $this->getPluginFlashMessenger();

        return $flashMessenger->getMessagesFromNamespace($namespace);
    }

    /**
     * Proxy the flash messenger plugin controller
     *
     * @param  string $method
     * @param  array  $argv
     * @return mixed
     */
    public function __call($method, $argv)
    {
        $flashMessenger = $this->getPluginFlashMessenger();
        return call_user_func_array([$flashMessenger, $method], $argv);
    }

    /**
     * Render Messages
     *
     * @param  string    $namespace
     * @param  array<array-key, string> $classes
     * @param  null|bool $autoEscape
     * @return string
     */
    public function render($namespace = 'default', array $classes = [], $autoEscape = null)
    {
        $flashMessenger = $this->getPluginFlashMessenger();
        $messages       = $flashMessenger->getMessagesFromNamespace($namespace);
        return $this->renderMessages($namespace, $messages, $classes, $autoEscape);
    }

    /**
     * Render Current Messages
     *
     * @param  string    $namespace
     * @param  array     $classes
     * @param  bool|null $autoEscape
     * @return string
     */
    public function renderCurrent($namespace = 'default', array $classes = [], $autoEscape = null)
    {
        $flashMessenger = $this->getPluginFlashMessenger();
        $messages       = $flashMessenger->getCurrentMessagesFromNamespace($namespace);
        return $this->renderMessages($namespace, $messages, $classes, $autoEscape);
    }

    /**
     * Render Messages
     *
     * @param string    $namespace
     * @param array<array-key, string> $messages
     * @param array<array-key, string> $classes
     * @param bool|null $autoEscape
     * @return string
     */
    protected function renderMessages(
        $namespace = 'default',
        array $messages = [],
        array $classes = [],
        $autoEscape = null
    ) {
        if (empty($messages)) {
            return '';
        }

        // Prepare classes for opening tag
        if (empty($classes)) {
            if (isset($this->classMessages[$namespace])) {
                $classes = $this->classMessages[$namespace];
            } else {
                $classes = $this->classMessages['default'];
            }
            $classes = [$classes];
        }

        $autoEscape = $autoEscape ?? $this->autoEscape;

        // Flatten message array
        $escapeHtml           = $this->getEscapeHtmlHelper();
        $messagesToPrint      = [];
        $translator           = $this->getTranslator();
        $translatorTextDomain = $this->getTranslatorTextDomain();
        array_walk_recursive(
            $messages,
            function ($item) use (&$messagesToPrint, $escapeHtml, $autoEscape, $translator, $translatorTextDomain) {
                if ($translator !== null) {
                    $item = $translator->translate(
                        $item,
                        $translatorTextDomain
                    );
                }

                if ($autoEscape) {
                    $messagesToPrint[] = $escapeHtml($item);
                    return;
                }

                $messagesToPrint[] = $item;
            }
        );

        if (empty($messagesToPrint)) {
            return '';
        }

        // Generate markup
        $markup  = sprintf($this->getMessageOpenFormat(), ' class="' . implode(' ', $classes) . '"');
        $markup .= implode(
            sprintf($this->getMessageSeparatorString(), ' class="' . implode(' ', $classes) . '"'),
            $messagesToPrint
        );
        $markup .= $this->getMessageCloseString();
        return $markup;
    }

    /**
     * Set whether or not auto escaping should be used
     *
     * @param  bool $autoEscape
     * @return self
     */
    public function setAutoEscape($autoEscape = true)
    {
        $this->autoEscape = (bool) $autoEscape;
        return $this;
    }

    /**
     * Return whether auto escaping is enabled or disabled
     *
     * @return bool
     */
    public function getAutoEscape()
    {
        return $this->autoEscape;
    }

    /**
     * Set the string used to close message representation
     *
     * @param  string $messageCloseString
     * @return FlashMessenger
     */
    public function setMessageCloseString($messageCloseString)
    {
        $this->messageCloseString = (string) $messageCloseString;
        return $this;
    }

    /**
     * Get the string used to close message representation
     *
     * @return string
     */
    public function getMessageCloseString()
    {
        return $this->messageCloseString;
    }

    /**
     * Set the formatted string used to open message representation
     *
     * @param  string $messageOpenFormat
     * @return FlashMessenger
     */
    public function setMessageOpenFormat($messageOpenFormat)
    {
        $this->messageOpenFormat = (string) $messageOpenFormat;
        return $this;
    }

    /**
     * Get the formatted string used to open message representation
     *
     * @return string
     */
    public function getMessageOpenFormat()
    {
        return $this->messageOpenFormat;
    }

    /**
     * Set the string used to separate messages
     *
     * @param  string $messageSeparatorString
     * @return FlashMessenger
     */
    public function setMessageSeparatorString($messageSeparatorString)
    {
        $this->messageSeparatorString = (string) $messageSeparatorString;
        return $this;
    }

    /**
     * Get the string used to separate messages
     *
     * @return string
     */
    public function getMessageSeparatorString()
    {
        return $this->messageSeparatorString;
    }

    /**
     * Set the flash messenger plugin
     *
     * @param  PluginFlashMessenger $pluginFlashMessenger
     * @return FlashMessenger
     * @throws InvalidArgumentException For an invalid $pluginFlashMessenger.
     */
    public function setPluginFlashMessenger($pluginFlashMessenger)
    {
        if (
            ! $pluginFlashMessenger instanceof PluginFlashMessenger
        ) {
            throw new InvalidArgumentException(sprintf(
                '%s expects a %s instance; received %s',
                __METHOD__,
                PluginFlashMessenger::class,
                is_object($pluginFlashMessenger) ? get_class($pluginFlashMessenger) : gettype($pluginFlashMessenger)
            ));
        }

        $this->pluginFlashMessenger = $pluginFlashMessenger;
        return $this;
    }

    /**
     * Get the flash messenger plugin
     *
     * @return PluginFlashMessenger
     */
    public function getPluginFlashMessenger()
    {
        if (null === $this->pluginFlashMessenger) {
            $this->setPluginFlashMessenger(new PluginFlashMessenger());
        }
        assert($this->pluginFlashMessenger instanceof PluginFlashMessenger);

        return $this->pluginFlashMessenger;
    }

    /**
     * Retrieve the escapeHtml helper
     *
     * @return EscapeHtml
     */
    protected function getEscapeHtmlHelper()
    {
        if ($this->escapeHtmlHelper) {
            return $this->escapeHtmlHelper;
        }

        $view = $this->getView();

        if ($view && method_exists($view, 'plugin')) {
            $plugin = $view->plugin('escapehtml');
            assert($plugin instanceof EscapeHtml);
            $this->escapeHtmlHelper = $plugin;
        }

        if (! $this->escapeHtmlHelper instanceof EscapeHtml) {
            $this->escapeHtmlHelper = new EscapeHtml();
        }

        return $this->escapeHtmlHelper;
    }
}
