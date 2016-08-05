Feature: Routing
  For this application there will the following routes:
  - /books GET|POST|DELETE
  - /books/:id GET|PUT|PATCH|DELETE
  - /authors GET|POST|DELETE
  - /authors/:id GET|PUT|PATCH|DELETE
  - /authors/:id/books GET|POST|DELETE

  This feature should test that requesting anything else results in the
  expected error code

  Scenario: requesting books is successful
    When I send a GET to "/books"
    Then the response status is 200

  Scenario: creating a new book is successful
    When I send a POST to "/books"
    Then the response status is 201

  Scenario: creating a new book is successful
    When I send a DELETE to "/books"
    Then the response status is 204

  Scenario: attempting to put to the books collection fails
    When I send a PUT to "/books"
    Then the response status is 405

  Scenario: attempting to patch the books collection fails
    When I send a PATCH to "/books"
    Then the response status is 405

  Scenario: requesting a single book is successful
    When I send a GET to "/books/1"
    Then the response status is 200

  Scenario: deleting a single book is successful
    When I send a DELETE to "/books/1"
    Then the response status is 204
