# Middleman Disqus

[![Build Status](https://travis-ci.org/simonrice/middleman-disqus.png)](https://travis-ci.org/simonrice/middleman-disqus)
[![Gem Version](https://badge.fury.io/rb/middleman-disqus.png)](http://badge.fury.io/rb/middleman-disqus)
[![Dependency Status](https://gemnasium.com/simonrice/middleman-disqus.png)](https://gemnasium.com/simonrice/middleman-disqus) 
[![Code Climate](https://codeclimate.com/github/simonrice/middleman-disqus.png)](https://codeclimate.com/github/simonrice/middleman-disqus)

Middleman-Disqus is a [Middleman](https://github.com/middleman/middleman)
extension that generates the Disqus embed code, and keeps your config
in `config.rb`, where it belongs.

This plugin is based on [middleman-google-analytics](https://github.com/MrJoy/middleman-google-analytics).

## Installation

If you already have a Middleman project:

Add `gem "middleman-disqus"` to your `Gemfile` then open up your `config.rb` and add:

```ruby
# Activate Disqus extension
activate :disqus do |d|
  d.shortname = "your_shortname"
end
```

Then, in your relevant layout(s), after your footer, call `disqus` and
include the results in the page.  For example, in HAML:

```haml
= disqus
```

Or ERB:

```erb
<%= disqus %>
```

## Only Including Embed Code in Builds

To include the embed code only in builds, and not when running
`middleman server`, simply add environment-specific configurations in your
`config.rb`:

```ruby
configure :development do
  activate :disqus do |d|
    d.shortname = false
  end
end

configure :build do
  activate :disqus do |d|
    d.shortname = "your_shortname"
  end
end
```

## Usage

Once you've bundled you should be able to run middleman as normal, and have it
display the Disqus comments box.

## License

Usage is provided under the MIT License. See the LICENSE file for the full details.
