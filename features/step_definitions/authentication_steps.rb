When /^I sign out$/ do
  step %{I click "Sign Out"}
end

Given /^there is a user "(.*?)" with password "(.*?)"$/ do |login, password|
  @user = Fabricate(:user, login: login, password: password, password_confirmation: password)
end

Given /^there is a user "(.*?)" with password "(.*?)" $/ do |login, password|
  @user = Fabricate(:user, login: login, password: password, password_confirmation: password)
end

Given /^I am signed in as "(.*?)"$/ do |login|
  @user = Fabricate(:user, login: login)
  sign_in_as @user
end

Given /^I am signed in as an admin$/ do
  @user = Fabricate(:user, :admin => true)
  sign_in_as @user
end

Given /^I am signed in$/ do
  @user = Fabricate(:user)
  sign_in_as @user
end

def sign_in_as user
  steps %Q{
    Given I am on the homepage
    When I click "Sign In"
    And I fill in "#{user.username}" for "Login"
    And I fill in "password" for "Password"
    And I click "Sign in"
    Then I should see the alert "You are now signed in."
  }
end
