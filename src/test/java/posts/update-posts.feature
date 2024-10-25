@UpdatePosts
Feature: PUT Requests for JSONPlaceholder API
Test the update of existing posts via the API.

  Background:
    Given url baseUrl + '/posts'

  Scenario: Update an existing post successfully
    Given path '1'
    And request {id: 1, title: 'foo', body: 'bar', userId: 1 }
    When method put
    Then status 200
    And match response == { id: 1, title: 'foo', body: 'bar', userId: 1}

  Scenario: Attempt to update a non-existent post
    Given path '9999'
    And request {id: 9999,title: 'non-existent',body: 'this post does not exist',userId: 10}
    When method put
    Then status 400
    And match response.error == 'This post does not exist'

  Scenario: Update a post with missing fields
    Given path '1'
    And request {id: 1,title: 'updated title'}
    When method put
    Then status 400
    And match response.error == 'All elements are required'

  Scenario: Update a post with additional fields
    Given path '1'
    And request {id: 1,title: 'foo',body: 'bar',userId: 1,extraField: 'extraValue'}
    When method put
    Then status 400
    And match response.error == 'extraField is not valid'

  Scenario: Attempt to update a post with incorrect Content-Type
    Given path '1'
    And request {id: 1,title: 'foo',body: 'bar',userId: 1}
    And header Content-Type = 'text/plain'
    When method put
    Then status 400



