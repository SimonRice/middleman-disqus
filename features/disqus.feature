@new
Feature: Adds a Disqus embed code
  Scenario: The Disqus embed code is added with the configured short name
    Given a successfully built app at "disqus-app"
    When I cd to "build"
    Then the following files should exist:
      | index.html |
            
    And the file "index.html" should contain 'div id="disqus_thread"'
    And the file "index.html" should contain "dsq.src = '//test-name.disqus.com/embed.js';"
