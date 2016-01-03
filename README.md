# Middleman Disqus

[![Build Status](https://travis-ci.org/simonrice/middleman-disqus.svg)](https://travis-ci.org/simonrice/middleman-disqus)
[![Gem Version](https://badge.fury.io/rb/middleman-disqus.svg)](http://badge.fury.io/rb/middleman-disqus)
[![Dependency Status](https://gemnasium.com/simonrice/middleman-disqus.svg)](https://gemnasium.com/simonrice/middleman-disqus)
[![Code Climate](https://codeclimate.com/github/simonrice/middleman-disqus.svg)](https://codeclimate.com/github/simonrice/middleman-disqus)

Middleman-Disqus is a [Middleman](https://github.com/middleman/middleman)
extension that generates the Disqus embed code, and keeps your config
in `config.rb`, where it belongs.

## Installation


1. Specify the dependency in your project's `Gemfile`:

  ```ruby
  # Gemfile
  gem "middleman-disqus"
  ```

2. Activate the Disqus extension in your project's `config.rb`.
**(n.b. read [important information about shortnames](#important-do-not-use-real-shortnames-during-development))**

  ```ruby
  # config.rb
  activate :disqus do |d|
    d.shortname = 'your-shortname' # Replace with your Disqus shortname.
  end
  ```

3. In your layout or template call `disqus` and/or `discus_count` and
include the results in the page:

  **Haml:**

  ```haml
  / link with `#disqus_thread` is optional if not using `disqus_count` -->
  %a{:href => "http://example.com/foo.html#disqus_thread"} Comments

  = disqus
  = disqus_count
  ```

  **ERB:**

  ```erb
  <!-- link with `#disqus_thread` is optional if not using `disqus_count` -->
  <a href="http://example.com/foo.html#disqus_thread">Comments</a>

  <%= disqus %>
  <%= disqus_count %>
  ```

## Helper methods

The following helper methods are available within your templates:

- `disqus` will include the Disqus embed.js code and display comments.
- `disqus_count` will include the Disqus count.js code for displaying
  a comment count on links when you set #disqus_thread to the href attribute.

## Configuration: config.rb

```ruby
activate :disqus do |d|
  # Disqus shotname, without '.disqus.com' on the end (default = nil)
  d.shortname = 'your_shortname'
end
```

## Configuration: YAML Frontmatter

You can set per page configuration variables in the YAML Fontmatter, these
are used as parameters for Disqus' behaviors and settings.

For full details about what they do, see [Disqus JavaScript configuration variables][djcv]

```yaml
---
disqus_identifier: /2012/the-best-day-of-my-life.html
disqus_title: The best day of my life
disqus_url: http://example.com/2012/the-best-day-of-my-life.html
disqus_category_id: 4
disqus_disable_mobile: true
---

Page with YAML Frontmatter.
```

## IMPORTANT: Do not use real shortnames during development

If you use the live/production shortname during development and testing, expect
to litter your Disqus account with discussions that you can't delete!

You have two options:

- Create a special testing/development shortname for use during development.
- Only include Disqus in builds, not when running `middleman server`.

You can set different options for `build` and `development` by using
Middleman's [environment specific settings][ess], for example:

```ruby
# config.rb
configure :development do
  activate :disqus do |d|
    # using a special shortname
    d.shortname = "development-shortname"
    # or setting to `nil` will stop Disqus loading
    d.shortname = nil
  end
end

configure :build do
  activate :disqus do |d|
    # using a different shortname for production builds
    d.shortname = "production-shortname"
  end
end
```

## License

Usage is provided under the MIT License. See the LICENSE file for the full details.

[ess]: http://middlemanapp.com/advanced/configuration/#environment-specific-settings
[djcv]: https://help.disqus.com/customer/portal/articles/472098-javascript-configuration-variables
