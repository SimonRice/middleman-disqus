require "middleman-core"

class Disqus < ::Middleman::Extension
  option :shortname, false, "Your short name for Disqus"
  
  def initialize(app, options_hash={}, &block)
    super
    
    app.set :disqus_shortname, options.shortname
  end
  
  helpers do
    def disqus
      if disqus_shortname
        %Q{<div id="disqus_thread"></div>
            <script type="text/javascript">
            //<![CDATA[
                (function() {
                    var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                    dsq.src = '//#{disqus_shortname}.disqus.com/embed.js';
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

::Middleman::Extensions.register(:disqus, Disqus)
