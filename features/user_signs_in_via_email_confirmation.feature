Feature: Signing in
  In order to use the site
  As a user
  I want to be able to sign in

  Scenario: Signing in via confirmation
    Given there are the following users:
      | username | email                | password |
      | adam     | user@devbookclub.com | password |
    And "user@devbookclub.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed. You are now signed in."