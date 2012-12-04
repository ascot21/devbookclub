Feature: User view book list

  Scenario: User can view books index
    Given the following books:
      | title | description  | buy_link         | coverimage_file_name  |
      | Foo   | Foo Bar      | www.example.com  | image.jpeg            |
      | Hello | Hello, World | www.example2.com | image.jpeg            |
    And I am on the homepage
    When I press "Books"
    Then I should see "All Books"
    Then I should see the span "Foo"
    And I should see the span "Hello"

  Scenario: Linking to/from book show page
    Given the following books:
      | title | description  | buy_link         | coverimage_file_name  |
      | Foo   | Foo Bar      | www.example.com  | image.jpeg            |
    And I am on the home page
    When I press "Books"
    And I click "Foo"
    Then I should be on that book's page
    When I click "Books"
    Then I should be on /books
