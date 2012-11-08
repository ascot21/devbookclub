Feature: User view book list

  Scenario:
    Given the following books:
      | title | body         | buy_link         |
      | Foo   | Foo Bar      | www.example.com  |
      | Hello | Hello, World | www.example2.com |
    When I go to the homepage
    Then I should see the title "Foo"
    And I should see "Bar"
    And I should see "Buy the book"
    And I should see the title "Hello"
    And I should see "World"
    And I should see "Buy the book"

  Scenario: Linking to/from book show page
    Given the following book:
      | title    | Foo             |
      | body     | Foo Bar         |
      | buy_link | www.example.com |
    And I am on the homepage
    When I click "Foo"
    Then I should be on that blog book's page
    When I click "View All books"
    Then I should be on the homepage