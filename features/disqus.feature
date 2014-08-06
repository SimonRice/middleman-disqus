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
