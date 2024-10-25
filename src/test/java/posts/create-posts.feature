@CreatePosts
Feature: POST Requests for JSONPlaceholder API
Test the creation of new posts via the API.

  Background:
    Given url baseUrl + '/posts'
    And header Content-Type = 'application/json; charset=UTF-8'

  Scenario: Create a post successfully
    When request { title: 'foo', body: 'bar', userId: 1 }
    And method post
    Then status 201
    And assert response.id > 100
    And match response == { id: '#ignore', title: 'foo', body: 'bar', userId: 1 }

  Scenario: Create a post with missing title
    When request { body: 'bar', userId: 1 }
    And method post
    Then status 400
    And match response.error == 'Title is required'

  Scenario: Create a post with missing body
    When request { title: 'foo', userId: 1 }
    And method post
    Then status 400
    And match response.error == 'Body is required'

  Scenario: Create a post with missing userId
    When request { title: 'foo', body: 'bar' }
    And method post
    Then status 400
    And match response.error == 'User ID is required'


  Scenario: Create a post with non-existent userId
    When request { title: 'foo', body: 'bar', userId: 99999 }
    And method post
    Then status 400
    And match response.error == 'User Id non-existent'

  Scenario: Create a post with invalid userId
    When request { title: 'foo', body: 'bar', userId: 'invalid' }
    And method post
    Then status 400
    And match response.error == 'User ID must be a number'

  Scenario: Verify content type of POST response
    When request { title: 'foo', body: 'bar', userId: 1 }
    And method post
    Then status 201
    And match responseHeaders['Content-Type'][0] contains 'application/json'


  Scenario: Create a post with additional properties
    When request { title: 'foo', body: 'bar', userId: 1, extraField: 'extraValue' }
    And method post
    Then status 400
    And match response.error == 'extraField is not supported'