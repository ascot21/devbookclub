Feature: User creates a topic for a book
  As a person reading a book
  In order to start a discussion
  I want to write a topic

  Scenario: Happy Path
    Given there is a book
    And I am viewing that book
    Then I should see "Add a discussion topic to the book."
    When I fill in "Chapter One" for "Title"
    And I fill in "What did you get from this?" for "Body"
    And I press "Create Topic"
    Then I should see "Your topic has been added."
    And I should be viewing that book
    And I should see "Chapter One"

  Scenario: Skipping title and topic
    Given there is a book
    And I am viewing that book
    When I fill in "" for "Title"
    And I fill in "" for "Body"
    And I press "Create Topic"
    Then I should see "There was a problem creating your topic"
    And I should see "Topic can't be blank."
    And I should see "Body can't be blank."

  Scenario: Skipping title doesn't remove the topic body
    Given there is a book
    And I am viewing that book
    When I fill in "" for "Title"
    And I fill in "Foo" for "Body"
    And I press "Create Topic"
    Then I should see "There was a problem creating your topic"
    And I should see "Title can't be blank."
    And I should see "Foo" in the "Body" field
    And I should not see "Topic Title Goes Here"

  Scenario: Skipping body doesn't remove the topic title
    Given there is a book
    And I am viewing that book
    When I fill in "Bar" for "Title"
    And I fill in "" for "Body"
    And I press "Create Topic"
    Then I should see "There was a problem creating your topic"
    And I should see "Body can't be blank."
    And I should see "Bar" in the "Title" field
    And I should not see "Bar"

