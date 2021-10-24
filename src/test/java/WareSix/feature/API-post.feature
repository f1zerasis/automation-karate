@API
Feature: post endpoint 

Background: Define URL
    Given url 'https://jsonplaceholder.typicode.com'

Scenario: 01. Get all posts on page
    Given path 'posts'
    When method Get
    Then status 200

Scenario: 02. Get specict posts 
    Given path 'posts'
    Given params { id: 4, id: 2}
    When method Get
    Then status 200

Scenario: 03. All the data should not contains null value 
    Given path 'posts'
    When method Get
    Then status 200
    And match response !contains null

Scenario: 04. Get specict posts with assertion 
    Given path 'posts'
    Given params { id: 1}
    When method Get
    Then status 200
    And match response == [{"id":1,"title":"sunt aut facere repellat provident occaecati excepturi optio reprehenderit","body":"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto","userId":1}]
   
Scenario: 05. Get specict posts with assertion contain
    Given path 'posts'
    Given params { id: 1}
    When method Get
    Then status 200
    And match response[0].body contains 'consequuntur'

Scenario: 06. Get specict posts with assertion not contain
    Given path 'posts'
    Given params { id: 1}
    When method Get
    Then status 200
    And match each response..body !contains 'fernando'

Scenario: 07. The response should be in array format 
    Given path 'posts'
    When method Get
    Then status 200
    And match response == "#array"

Scenario: 08. Every field response should be in specict format 
    Given path 'posts'
    When method Get
    Then status 200
    And match each response == {"id": "#number", "title": "#string", "body": "#string", "userId": "#number"}

Scenario: 09. The total of the data is 100 
    Given path 'posts'
    When method Get
    Then status 200
    And match response == "#[100]"

Scenario: 10. Id should in number format 
    Given path 'posts'
    When method Get
    Then status 200
    And match each response..id == "#number"

