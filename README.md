# Middleman Disqus

Middleman-Disqus is a [Middleman](https://github.com/middleman/middleman)
extension that generates the Disqus embed code, and keeps your config
in `config.rb`, where it belongs.

## Installation

If you already have a Middleman project:

Add `gem "middleman-disqus"` to your `Gemfile` then open up your `config.rb` and add:

```ruby
# Activate Disqus extension
activate :disqus do |d|
  d.shortname = "your_shortname"
end
```

Then, in your layout, after your footer, call `disqus_tag` and
include the results in the page.  For example, in HAML:

```haml
= disqus_tag
```

Or ERB:

```erb
<%= disqus_tag %>
```

## Only Including Embed Code in Builds

To include the tracking code only in builds, and not when running
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
    ga.tracking_id = 'UA-XXXXXXX-X'
  end
end
```

## Usage

Once you've bundled you should be able to run middleman as normal, and have it
display the GA tracking code.

## License

Usage is provided under the MIT License. See the LICENSE file for the full details.
