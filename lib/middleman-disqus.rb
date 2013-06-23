# Require core library
require 'middleman-core'

# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
::Middleman::Extensions.register(:disqus) do
  require 'middleman-disqus/extension'

  # Return the extension module
  ::Middleman::Disqus
end
