require 'middleman-core'

module Middleman
  class DisqusExtension < Extension
    option :shortname, nil, 'Your short name for Disqus'

    def initialize(app, options_hash={}, &block)
      super
      # place in class variable so helpers can access
      @@options = options
    end

    def self.options(options = {})
      options = options.to_hash.map do |k,obj|
        k =~ /^disqus_(.*)$/ ? [$1, obj] : nil
      end
      options = Hash[options.compact]
      @@options.to_h.merge(options).with_indifferent_access
    end

    helpers do
      def disqus(call_options = {})
        page_options = current_resource.metadata[:page].merge(call_options)
        @options = Middleman::DisqusExtension.options(page_options)
        return '' unless @options[:shortname]

        file = File.join(File.dirname(__FILE__), 'embed.erb')
        ERB.new(File.read(file), 0, '>').result(binding)
      end

      def disqus_count
        @options = Middleman::DisqusExtension.options
        return '' unless @options[:shortname]

        file = File.join(File.dirname(__FILE__), 'count.erb')
        ERB.new(File.read(file), 0, '>').result(binding)
      end
    end
  end
end
