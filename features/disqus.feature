Feature: Disqus Integration

  Scenario: The Disqus shotname is not set
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

  Scenario: The Disqus embed code is added with configured shortname
    Given a fixture app "disqus-app"
    And a file named "config.rb" with:
      """
      activate :disqus do |d|
        d.shortname = 'test-name'
      end
      """
    And a successfully built app at "disqus-app"
    When I cd to "build"
    Then the following files should exist:
      | index.html |
    And the file "index.html" should contain 'div id="disqus_thread"'
    And the file "index.html" should contain "var disqus_shortname = 'test-name';"
