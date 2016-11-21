require 'spec_helper'
#require '/../../app/controllers/application_controller.rb'


# describe "user log in" do
#   it "allows an existing user to sign in" do
#     @user = Users.new!(:email => "me@home.com", :password => "123654", :password_confirmation => "123654")
#     @user.save!
#     visit "/users/sign_in"

#     fill_in "Email", with: "me@home.com"
#     fill_in "Password", with: "123654"

#     click_button "Sign in"

#     expect(page).to have_content("Signed in successfully.")
#   end
# end