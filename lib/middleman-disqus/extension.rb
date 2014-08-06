require "middleman-core"

module Middleman
  class DisqusExtension < Extension
    option :shortname, nil, "Your short name for Disqus"

    def initialize(app, options_hash={}, &block)
      super
      # place in class variable so helpers can access
      @@options = options
    end

    def self.options(options = {})
      @@options.to_h.merge(options)
    end

    helpers do
      def disqus
        @options = Middleman::DisqusExtension.options({})
        return '' unless @options[:shortname]

        file = File.join(File.dirname(__FILE__), 'embed.erb')
        ERB.new(File.read(file)).result(binding)
      end

      def disqus_count
        @options = Middleman::DisqusExtension.options({})
        return '' unless @options[:shortname]
        #current_resource.metadata[:page].merge(disqus_settings)

        file = File.join(File.dirname(__FILE__), 'count.erb')
        ERB.new(File.read(file)).result(binding)
      end
    end

  end
end
