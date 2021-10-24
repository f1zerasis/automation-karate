@API
Feature: post comments endpoint 

Background: Define URL
    * def dataGenerator = Java.type('Helpers.DataGenerator')
    * def randomNumber = dataGenerator.getRandomNumber()
    Given url 'https://jsonplaceholder.typicode.com/posts/'+randomNumber+'/comments'

@debug
Scenario: 01. Get all comments on specifict post
    When method Get
    Then status 200

Scenario: 02. Make sure there is no null value
    When method Get
    Then status 200
    And match response !contains null

Scenario: 03. Get 5 comments for each post  
    When method Get
    Then status 200
    And match response == "#[5]"

Scenario: 04. Every field response should be in specict format   
    When method Get
    Then status 200
    And match each response == 
    """
        {
            "postId": "#number",
            "id": "#number",
            "name": "#string",
            "email": "#string",
            "body": "#string"
        }
    """
Scenario: 05. Random check, mail field should contain @ sysmbol  
    When method Get
    Then status 200
    And match response[0].email contains '@'

Scenario: 06. PostId should be the same with generator number  
    When method Get
    Then status 200
    And match response[0].postId == randomNumber