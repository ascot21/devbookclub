Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    @user = User.create!(attributes)
  end
end

Given /^I am signed in as them$/ do
  steps(%Q{
    Given I am on the homepage
    When I click "Sign in"
    And I fill in "adam" for "Login"
    And I fill in "password" with "password"
    And I press "Sign in"
    Then I should see "You are now signed in."
  })
end

Given /^I am signed in as "([^\"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  steps("Given I am signed in as them")
end