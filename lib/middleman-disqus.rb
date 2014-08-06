require 'middleman-core'
require 'middleman-disqus/version'

::Middleman::Extensions.register(:disqus) do
  require 'middleman-disqus/extension'
  ::Middleman::DisqusExtension
end
