# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'middleman-disqus/version'

Gem::Specification.new do |s|
  s.name        = 'middleman-disqus'
  s.version     = Middleman::Disqus::VERSION
  s.authors     = ['Simon Rice', 'Luke Antins']
  s.email       = ['im@simonrice.com']
  s.homepage    = 'http://github.com/simonrice/middleman-disqus'
  s.license     = 'MIT'
  s.summary     = %q{Quickly integrate Disqus comments into your Middleman site}
  s.description = <<-EOL
A Middleman extension to integrate Disqus into your site,
supporting Disqus configuration variables and comment counts.
EOL

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {features,fixtures}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency('middleman-core', ['~> 4.0'])
end
