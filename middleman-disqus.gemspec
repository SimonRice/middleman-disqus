# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "middleman-disqus"
  s.version     = Middleman::Disqus::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Simon Rice"]
  s.email       = ["im@simonrice.com"]
  s.homepage    = "http://github.com/simonrice/middleman-disqus"
  s.license     = 'MIT'
  s.summary     = %q{A Middleman plugin for adding the Disqus embed code.}
  # s.description = %q{A longer description of your extension}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 3.1.0"])

  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end
