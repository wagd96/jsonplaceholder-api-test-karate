@GetPosts
Feature: Extended GET Requests for JSONPlaceholder API
Test different GET endpoints of the API with extended scenarios.

  Background:
    Given url baseUrl

  Scenario: Get all posts successfully
    Given path '/posts'
    When method get
    Then status 200
    And match response[0].id == 1
    And match parseInt(response.length) == 100

  Scenario: Get all posts and verify content type
    Given path '/posts'
    When method get
    Then status 200
    And match responseHeaders['Content-Type'][0] contains 'application/json'

  Scenario: Get a specific post by ID
    Given path '/posts/1'
    When method get
    Then status 200
    And match response.id == 1
    And match response.userId == 1
    And match response.title == "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
    And match response.body == "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"

  Scenario: Get non-existent post by ID
    Given path '/posts/9999'
    When method get
    Then status 404
    And match response == {}

  Scenario: Get comments for a specific post
    Given path '/posts/1/comments'
    When method get
    Then status 200
    And match each response == { postId: 1, id: '#ignore', name: '#ignore', email: '#ignore', body: '#ignore' }
    * def total = parseInt(response.length)
    And assert total > 0

  Scenario: Get comments using query parameter (postId)
    Given path '/comments'
    And param postId = 1
    When method get
    Then status 200
    * def totalPosts = parseInt(response.length)
    And match each response[*].postId == 1
    And assert totalPosts > 0

  Scenario: Get comments for non-existent post
    Given path '/comments'
    And param postId = 9999
    When method get
    Then status 200
    And match response == []

  Scenario: Get posts with query parameter (limit results)
    Given path '/posts'
    And param _limit = 5
    When method get
    Then status 200
    And match parseInt(response.length) == 5

  Scenario: Get posts with query parameter (offset results)
    Given path '/posts'
    And param _start = 5
    And param _limit = 5
    When method get
    Then status 200
    And match parseInt(response.length) == 5
    And match response[0].id == 6