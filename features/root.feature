Feature: root endpoint

  Scenario: the application is running

    When I send a GET to "/"
    Then the response status is 200
