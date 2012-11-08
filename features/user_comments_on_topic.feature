Feature: User comments on a book topic
  As a person reading a book topic
  In order to contribute to the discussion
  I want to write a comment

  Scenario: Happy Path
    Given there is a topic
    And I am viewing that topic
    Then I should see "Add your comment."
    When I fill in "Adam" for "Name"
    And I fill in "So confusing." for "Body"
    And I press "Create comment"
    Then I should see "Your comment has been added."
    And I should be viewing that topic
    And I should see "Adam says: So confusing."

  Scenario: Skipping title and topic
    Given there is a topic
    And I am viewing that topic
    When I fill in "" for "Name"
    And I fill in "" for "Body"
    And I press "Create comment"
    Then I should see "There was a problem creating your comment."
    And I should see "Name can't be blank."
    And I should see "Body can't be blank."

  Scenario: Skipping title doesn't remove the comment body
    Given there is a topic
    And I am viewing that topic
    When I fill in "" for "Name"
    And I fill in "Foo" for "Body"
    And I press "Create comment"
    Then I should see "There was a problem creating your comment."
    And I should see "Name can't be blank."
    And I should see "Foo" in the "Body" field
    And I should not see "Adam says: Foo"

  Scenario: Skipping body doesn't remove the comment title
    Given there is a topic
    And I am viewing that topic
    When I fill in "Adam" for "Name"
    And I fill in "" for "Body"
    And I press "Create comment"
    Then I should see "There was a problem creating your comment"
    And I should see "Body can't be blank."
    And I should see "Adam" in the "Name" field
    And I should not see "Adam says: Bar"

