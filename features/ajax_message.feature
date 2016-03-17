Feature: Non-refresh messaging
  as a user
  I want to be able to enter a message with refreshing the page
  so that I have a clean user experience
  
Scenario: Sending a message
  Given I am in a conversation
  When I fill in "submit message:" with "hey"
  And I press "submit"
  Then the page should not refresh
  And I should see "hey" in the conversation
  