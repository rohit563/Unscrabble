Feature: Alert user to a failed login attempt

Scenario:  Failed login attempt
  When I have attempted to login with username "charles-miles@uiowa.edu" and password "123456"
  And I am on the UnBoggler home page  
  Then I should see a message that says "Invalid Email or password."
  
  
# Scenario: Visit the signup page
#   When I click the Signup page "new_user_registration_path"
#   Then I should see "Un-Scrabble"