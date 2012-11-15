Feature: Signing up
  In order to be able to contribute comments
  As a user
  I want to be able to sign up

  Scenario: Signing up
    Given I am on the homepage
    When I click "Sign Up"
    And I fill in "user@devbookclub.com" for "Email"
    And I fill in "adam" for "Username"
    And I fill in "password" for "Password"
    And I fill in "password" for "Password confirmation"
    And I click "Sign up"
    Then I should see "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."
    Then save and open all raw emails