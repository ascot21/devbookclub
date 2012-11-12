Feature: User creates book
  As a user
  In order to start a book discussion
  I want to publish a book page

  Acceptance Criteria:
  * Book must have title,description and a buy_link
  * Book must be publicly visible once saved

  Scenario: Happy Path
    Given I am on the homepage
    And I click "New Book"
    Then I should see "Fill in your book info here"
    When I fill in "The Pragmatic Programmer" for "Title"
    And I fill in "Description to come soon" for "Description"
    And I fill in "www.example.com" for "Buy link"
    And I press "Create Book"
    Then I should see "Your book has been added."
    And I should see the title "The Pragmatic Programmer"
    And I should see "Description to come soon"
    And I should see the link "Buy the Book"

  Scenario: User attempts to skip title
    Given I am on the homepage
    And I click "New Book"
    Then I should see "Fill in your book info here"
    When I fill in "" for "Title"
    And I fill in "Description to come" for "Description"
    And I fill in "www.another.com" for "Buy link"
    And I press "Create Book"
    Then I should not see "Your book has been published."
    And I should see "" in the "Title" field
    And I should see "Description to come" in the "Description" field
    And I should see "www.another.com" in the "Buy link" field
    And I should see "Title can't be blank"

  Scenario: User attempts to skip Description
    Given I am on the homepage
    And I click "New Book"
    Then I should see "Fill in your book info here"
    When I fill in "The Pragmatic Programmer Second Edition" for "Title"
    And I fill in "" for "Description"
    And I fill in "www.anotherexample.com" for "Buy link"
    And I press "Create Book"
    Then I should not see "Your book has been published."
    And I should see "The Pragmatic Programmer Second Edition" in the "Title" field
    And I should see "" in the "Description" field
    And I should see "www.anotherexample.com" in the "Buy link" field
    And I should see "Description can't be blank"

  Scenario: User attempts to skip Buy link
    Given I am on the homepage
    And I click "New Book"
    Then I should see "Fill in your book info here"
    When I fill in "The Pragmatic Programmer Third Edition" for "Title"
    And I fill in "Description coming soon" for "Description"
    And I fill in "" for "Buy link"
    And I press "Create Book"
    Then I should not see "Your book has been published"
    And I should see "The Pragmatic Programmer Third Edition" in the "Title" field
    And I should see "Description coming soon" in the "Description" field
    And I should see "" in the "Buy link" field
    And I should see "Buy link can't be blank"
