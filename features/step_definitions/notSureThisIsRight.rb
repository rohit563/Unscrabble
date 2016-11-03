# failed login attempt test
Given /^A user is on the login page$/ do
  visit session_path
end

When /^I have attempted to login with username "(.*?)" and password "(.*?)"$/ do |username, password|
  fill_in 'Email', :with => username
  fill_in 'user_password', :with => password
  click_button 'Log in'
end

Then /^they should see a success message$/ do
  page.should have_selector ".alert", text: "Invalid Email or password."
end

When /^ I click the Signup page "(.*?)" $/ do |title|
  visit new_user_registration_path
end

Then /^(?:|I )should see "([^"]*)$/ do
  expect(page).to have_content("Un-Scrabble")
end