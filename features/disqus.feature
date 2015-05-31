Feature: Disqus Integration

  Scenario: Disqus config var `shotname` is not set
    Given a fixture app "disqus-app"
    And a file named "config.rb" with:
      """
      activate :disqus do |d|
        d.shortname = nil
      end
      """
    And the Server is running
    When I go to "/"
    Then I should see "0" lines
    When I go to "/count.html"
    Then I should see "0" lines

  Scenario: Basic usage, Disqus javascript is included when `shotname` is set
    Given a successfully built app at "disqus-app"
    When I cd to "build"
    Then the following files should exist:
      | index.html |
      | count.html |
    And the file "index.html" should contain 'div id="disqus_thread"'
    And the file "index.html" should contain "var disqus_shortname = 'test-name';"
    And the file "index.html" should contain 'disqus.com/embed.js'
    And the file "count.html" should contain "var disqus_shortname = 'test-name';"
    And the file "count.html" should contain 'disqus.com/count.js'

  Scenario: Per page Disqus variables
    Given a fixture app "disqus-app"
    And a file named "source/options.html.erb" with:
      """
      ---
      disqus_identifier: /2012/the-best-day-of-my-life.html
      disqus_title: The best day of my life
      disqus_url: http://example.com/2012/the-best-day-of-my-life.html
      disqus_category_id: 4
      disqus_disable_mobile: true
      ---
      <%= disqus %>
      """
    And a successfully built app at "disqus-app"
    When I cd to "build"
    Then the following files should exist:
      | options.html |
    And the file "options.html" should contain "var disqus_identifier = '/2012/the-best-day-of-my-life.html';"
    And the file "options.html" should contain "var disqus_title = 'The best day of my life';"
    And the file "options.html" should contain "var disqus_url = 'http://example.com/2012/the-best-day-of-my-life.html';"
    And the file "options.html" should contain "var disqus_category_id = 4;"
    And the file "options.html" should contain "var disqus_disable_mobile = true;"

  Scenario: Only set a couple of per page Disqus variables
    Given a fixture app "disqus-app"
    And a file named "source/options.html.erb" with:
      """
      ---
      disqus_category_id: 4
      disqus_disable_mobile: false
      ---
      <%= disqus %>
      """
    And a successfully built app at "disqus-app"
    When I cd to "build"
    Then the following files should exist:
      | options.html |
    And the file "options.html" should not contain "var disqus_identifier"
    And the file "options.html" should not contain "var disqus_title"
    And the file "options.html" should not contain "var disqus_url"
    And the file "options.html" should contain "var disqus_category_id = 4;"
    And the file "options.html" should contain "var disqus_disable_mobile = false;"

  Scenario: Per call Disqus variables
    Given a fixture app "disqus-app"
    And a file named "source/per-call-options.html.erb" with:
      """
      <%= disqus disqus_url: "http://example.com/2012/the-best-day-of-my-life.html" %>
      """
    And a successfully built app at "disqus-app"
    When I cd to "build"
    Then the following files should exist:
      | per-call-options.html |
    And the file "per-call-options.html" should contain "var disqus_url = 'http://example.com/2012/the-best-day-of-my-life.html';"

  Scenario: Per call Disqus variables overriding page variables
    Given a fixture app "disqus-app"
    And a file named "source/per-call-options.html.erb" with:
      """
      ---
      disqus_identifier: /2012/the-best-day-of-my-life.html
      disqus_url: http://example.com/2012/better-day-of-my-life.html
      ---
      <%= disqus disqus_url: "http://example.com/2012/the-best-day-of-my-life.html" %>
      """
    And a successfully built app at "disqus-app"
    When I cd to "build"
    Then the following files should exist:
      | per-call-options.html |
    And the file "per-call-options.html" should contain "var disqus_url = 'http://example.com/2012/the-best-day-of-my-life.html';"
