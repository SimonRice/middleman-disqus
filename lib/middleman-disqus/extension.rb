module Middleman
  module GoogleAnalytics
    class Options < Struct.new(:disqus_id); end

    class << self
      def options
        @@options ||= {}
      end

      def registered(app, options={})
        @@options ||= Options.new(options)
        yield @@options if block_given?

        app.send :include, InstanceMethods
      end
      alias :included :registered
    end

    module InstanceMethods
      def disqus
        options = ::Middleman::Disqus.options
        options.debug ||= not build?
        ga = options.debug ? 'ga' : '/u/ga_debug'
        if shortname = options.shortname
          %Q{<div id="disqus_thread"></div>
              <script type="text/javascript">
              //<![CDATA[
                  var disqus_shortname = '#{shortname}'; // required: replace example with your forum shortname
                  (function() {
                      var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                      dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                      (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                  })();
              //]]>
              </script>
              <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
              <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
          </script>}
        end
      end
    end
  end
end
