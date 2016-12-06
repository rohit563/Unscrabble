def create_visitor
  @visitor ||= {  :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  # delete_user
  visit '/users/sign_up'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  # find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "user[email]", :with => @visitor[:email]
  fill_in "user[password]", :with => @visitor[:password]
  click_button "Log in"
end

### GIVEN ###
Given /^I am not signed up as a user$/ do
  visit '/users/sign_up'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I am not logged in$/ do
 
#  visit (destroy_user_session_path, :method => :delete)
#   <%= link_to('Logout', destroy_user_session_path, :method => :delete) %>        
 
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

Given /^I am not authenticated$/ do
    
end

### Iteration 2 board steps ###

Given /^I have already signed in$/ do 
  create_user
  sign_in
end  
  

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/'
    click_link "Logout"
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "changeme123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When(/^I save the edit form$/) do
  click_button "Update"
end

When /^I edit my account name$/ do
  click_link "Edit account"
  fill_in "user_name", :with => "newname"
  fill_in "user_current_password", :with => @visitor[:password]
end

When /^I edit my email address$/ do
  click_link "Edit account"
  fill_in "user_email", :with => "newemail@example.com"
  fill_in "user_current_password", :with => @visitor[:password]
end

When(/^I don't enter my current password$/) do
  fill_in "user_current_password", :with => ""
end

When(/^I edit my email address with an invalid email$/) do
  click_link "Edit account"
  fill_in "user_email", :with => "notanemail"
  fill_in "user_current_password", :with => @visitor[:password]
end

When(/^I edit my password$/) do
  click_link "Edit account"
  fill_in "user_password", :with => "newpassword"
  fill_in "user_password_confirmation", :with => "newpassword"
  fill_in "user_current_password", :with => @visitor[:password]
end

When(/^I edit my password with missing confirmation$/) do
  click_link "Edit account"
  fill_in "user_password", :with => "newpassword"
  fill_in "user_current_password", :with => @visitor[:password]
end

When(/^I edit my password with missmatched confirmation$/) do
  click_link "Edit account"
  fill_in "user_password", :with => "newpassword"
  fill_in "user_password_confirmation", :with => "newpassword123"
  fill_in "user_current_password", :with => @visitor[:password]
end

When /^I look at the list of users$/ do
  visit '/'
end
    

When /^I go to root page$/ do
  visit  '/'
end

When /^I am on password reset page$/ do
  visit  '/users/password/new'
end

### Iteration 2 board steps WHEN ###

When /^I am on the home page$/ do
  visit '/'
end

When /^I click on the Logout tab$/ do
  click_link "Logout"
end

When /^I enter a single letter into each of the game board text fields then press the submit button$/ do
  fill_in "letters[0]", :with => "a"
  fill_in "letters[1]", :with => "t"
  fill_in "letters[2]", :with => "r"
  fill_in "letters[3]", :with => "a"
  fill_in "letters[4]", :with => "m"
  fill_in "letters[5]", :with => "n"
  fill_in "letters[6]", :with => "g"
  fill_in "letters[7]", :with => "a"
  fill_in "letters[8]", :with => "s"
  fill_in "letters[9]", :with => "l"
  fill_in "letters[10]", :with => "a"
  fill_in "letters[11]", :with => "o"
  fill_in "letters[12]", :with => "a"
  fill_in "letters[13]", :with => "g"
  fill_in "letters[14]", :with => "n"
  fill_in "letters[15]", :with => "d"
  click_button "Submit"
end

When /^I click on a specific saved game$/ do 
  click_button "View Saved Game"
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

# Then /^I see a successful sign in message$/ do
#   page.should have_content "Signed in successfully."
# end

Then /^I should see a successful sign up message$/ do
  page.should have_link("Logout", :href => "/users/sign_out")
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Password confirmation doesn't match Password"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password confirmation doesn't match Password"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid Email or password."
end
Then /^I should be redirected to signin page$/ do
  page.should have_content "Invalid Email or password."
end

Then /^I should see an account edited message$/ do
    page.should have_content "You updated your account successfully."
end

Then(/^I should see a current password missing message$/) do
    page.should have_content "Current password can't be blank"
end

Then /^I should see my name$/ do
     create_user
     page.should have_content @user[:name]
end

Then /^I see sign-in form$/ do
    page.should have_field("user[email]")
     page.should have_field("user[password]")
end
Then /^I should be redirected to sign in page$/ do
  
end
And /^I should see password reset message$/ do
     page.should have_content "You will receive an email with instructions on how to reset your password in a few minutes."

end

   Then /^I should see password reset error message$/ do
        page.should have_content "Email not found"
      end

And /^I give it valid email and submit$/ do
  fill_in "user_email", :with => @visitor[:email]
  click_button "Send"
end

And /^I give it invalid email and submit$/ do
  fill_in "user_email", :with => "ifnfiaenjfea@22233.com"
  click_button "Send"
end

Then /^I see the Save Game Tab$/ do 
  page.should have_link("Save Game", :href => "#")
end
  
And /^I see the new game tab$/ do 
  page.should have_link("New Game", :href => "#")
end

And /^I see the view saved game tab$/ do 
  page.should have_link("View Saved Game", :href => "#")
end

And /^I see the logout tab$/ do 
  page.should have_link("Logout", :href => "/users/sign_out")
end
  
Then /^I am redirected to the sign in page$/ do 
  page.should have_content "Signed out successfully"
end  

Then /^I should see current number of games$/ do 
  page.should have_content "Current number of Games"
end  
  
  
  