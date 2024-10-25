@DeletePosts
Feature: DELETE Requests for JSONPlaceholder API
Test the deletion of existing and non-existing posts via the API.

  Background:
    Given url baseUrl + '/posts'

  Scenario: Delete an existing post successfully
    Given path '1'
    When method delete
    Then status 200
    And match response == {}

  Scenario: Attempt to delete a post that does not exist
    Given path '9999'
    When method delete
    Then status 404
    And match response == {}