Given /^there is a topic$/ do
  step %{1 topic}
end

Given /^I am viewing that topic$/ do
  step %{I am on that topic's page}
end

Then /^I should be viewing that topic$/ do
  step %{I should be on that topic's page}
end
