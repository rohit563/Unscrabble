Feature: Password reset
  
      Scenario: User is not authenticated and forgot password
       Given I exist as a user
        When I am on password reset page
        And I give it valid email and submit
        Then I should be redirected to sign in page 
        And I should see password reset message
        
        
      Scenario: User tries to retrieve password with invalid password
       Given I do not exist as a user
        When I am on password reset page
        And I give it invalid email and submit
        Then I should see password reset error message
        
        
       #empty email check too
       #You will receive an email with instructions on how to reset your password in a few minutes.