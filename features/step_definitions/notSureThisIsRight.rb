Given /^a valid user$/ do
  @user = User.create!({
             :email => "minikermit@hotmail.com",
             :password => "12345678",
             :password_confirmation => "12345678"
           })
end

Given /^a logged in user$/ do
  Given "a valid user"
  visit signin_url
  fill_in "user_email", :with => "minikermit@hotmail.com"
  fill_in "user_password", :with => "12345678"
  click_button "Log in"
end