@wip
Feature: Signing in to admin
  In order to be able to administer the site
  As a admin user
  I need to be able to login to the admin area

Scenario: As a regular user who is signed in, I am redirected to the homepage
  Given I am signed in
  And I am on the homepage
  Then I should not see "Admin"
  And I go to the admin page
  Then I should be on the homepage
  And I should see "You must be an admin to do that."

Scenario: If I am not signed in, I am redirected to login
  Given I am on the homepage
  Then I should not see "Admin"
  And I go to the admin page
  Then I should be on the homepage
  And I should see "You must be an admin to do that."

Scenario: As an admin user, I can see the admin dashboard
  Given I am signed in as an admin
  Then I should see "Admin"
  When I click "Admin"
  Then I should see "Dashboard"