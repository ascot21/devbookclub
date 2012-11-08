Feature: User edits book

  Background:
    Given the following book:
      | title | Foo |
      | description  | Bar |
      | buy_link | www.example.com |
    And I am on that book's page

  Scenario: Successful edit
    When I click "Edit book"
    And I fill in "Food" for "Title"
    And I fill in "At a bar-b-que" for "Description"
    And I fill in "www.example.com" for "Buy_link"
    And I press "Update book"
    Then I should be on that blog book's page
    And I should see the title "Food"
    And I should see "At a bar-b-que"
    And I should see "Buy the book"

  Scenario: Unsuccessful edit bc no description
    When I click "Edit book"
    And I fill in "This will be there" for "Title"
    And I fill in "" for "Description"
    And I fill in "www.example.com" for "Buy_link"
    And I press "Update book"
    Then I should see "Description can't be blank"
    And I should see "This will be there" in the "Title" field
    And I should see "www.example.com" in the "Buy_link" field

  Scenario: Unsuccessful edit bc no buy link
    When I click "Edit book"
    And I fill in "This will be there" for "Title"
    And I fill in "What a compelling description" for "Description"
    And I fill in "" for "Buy_link"
    And I press "Update book"
    Then I should see "Buy link can't be blank"
    And I should see "This will be there" in the "Title" field
    And I should see "What a compelling description" in the "Description" field
