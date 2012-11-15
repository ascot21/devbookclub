Scenario: As a regular user who is signed in, I am redirected to the homepage
  Given I am signed in
  And I am on the homepage
  When I go to /admin
  Then I should be on /

Scenario: If I am not signed in, I am redirected to login
  When I go to /admin
  Then I should be on /users/sign_in

Scenario: As an admin user, I can see the admin dashboard
  Given I am signed in as an admin
  When I go to /admin
  Then I should be on /admin
  And I should see "Dashboard"