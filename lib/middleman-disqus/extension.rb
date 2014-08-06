require "middleman-core"

module Middleman
  class DisqusExtension < Extension
    option :shortname, nil, "Your short name for Disqus"

    def initialize(app, options_hash={}, &block)
      super
      app.set :disqus_shortname, options.shortname
    end

    helpers do
      def disqus
        return '' unless disqus_shortname
        %Q{
          <div id="disqus_thread"></div>
          <script type="text/javascript">
          //<![CDATA[
              var disqus_shortname = '#{disqus_shortname}';
              (function() {
                  var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                  dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                  (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
              })();
          //]]>
          </script>
          <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
          <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
        }
      end

      def disqus_count
        return '' unless disqus_shortname
        %Q{
          <script type="text/javascript">
          //<![CDATA[
              var disqus_shortname = '#{disqus_shortname}';

              (function () {
                  var s = document.createElement('script'); s.async = true;
                  s.type = 'text/javascript';
                  s.src = '//' + disqus_shortname + '.disqus.com/count.js';
                  (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
              }());
          //]]>
          </script>
        }      
      end
    end

  end
end