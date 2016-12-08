Feature: Saved Games
  
    Scenario: Accessing Saved Game Page
        Given I have already signed in
        And I am on the home page
        When I click the Saved Game Page button
        Then I am redirected to that specific users saved games
    
    Scenario: Loading Saved game
        Given I am on the Saved Game page
        When I click the link to a saved game
        Then the game is loaded on the game load page
    
    
    Scenario: Delete Saved Game
        Given I have already signed in
        And I am on the home page
        And I have loaded a game
        When I click on the delete game tab
        Then the game is removed from the database