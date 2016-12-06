Feature: Board
  
    Scenario: Home page contents
        Given I have already signed in
        When I am on the home page
        Then I see the Save Game Tab
        And I see the new game tab
        And I see the view saved game tab
        And I see the logout tab
    
    Scenario: Logout
        Given I have already signed in
        And I am on the home page
        When I click on the Logout tab
        Then I am redirected to the sign in page
    
    Scenario: Submit Game board
        Given I have already signed in
        And I am on the home page
        When I enter a single letter into each of the game board text fields then press the submit button
        Then I should see current number of games
        
    Scenario: Load Saved Game
        Given I have already signed in
        And I am on the home page
        When I click on a specific saved game
        Then The game is loaded onto the screen
        
    Scenario: Delete Saved Game
        Given I have already signed in
        And I am on the home page
        And I have loaded a game
        When I click on the delete game tab
        Then the game is removed from the database
        
        
        
        
    