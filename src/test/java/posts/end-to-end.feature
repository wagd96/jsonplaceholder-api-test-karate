@E2E
Feature: End-to-End Scenarios for JSONPlaceholder API

  Background:
    Given url baseUrl + '/posts'

  Scenario: Create a new post, update it, and then delete it
    When request { title: 'New Post', body: 'This is a new post', userId: 1 }
    And method post
    Then status 201
    And match response == { title: 'New Post', body: 'This is a new post', userId: 1, id: '#ignore' }
    * def createdPostId = response.id

    Given path createdPostId
    And request { id: createdPostId, title: 'Updated Post', body: 'This is an updated post', userId: 1 }
    When method put
    Then status 200
    And match response == { id: createdPostId, title: 'Updated Post', body: 'This is an updated post', userId: 1 }

    Given path createdPostId
    When method delete
    Then status 200

    Given path createdPostId
    When method get
    Then status 404
    And match response == {}

  Scenario: Create multiple posts, retrieve them, and then delete them
    When request { title: 'Post 1', body: 'First post', userId: 1 }
    And method post
    Then status 201
    * def postId1 = response.id

    When request { title: 'Post 2', body: 'Second post', userId: 1 }
    And method post
    Then status 201
    * def postId2 = response.id

    Given url baseUrl + '/posts'
    When method get
    Then status 200
    And assert parseInt(response.length) > 100
    And match response contains { id: postId1, title: 'Post 1', userId: 1 }
    And match response contains { id: postId2, title: 'Post 2', userId: 1 }

    Given path postId1
    When method delete
    Then status 200

    Given path postId2
    When method delete
    Then status 200

    Given path postId1
    When method get
    Then status 404

    Given path postId2
    When method get
    Then status 404