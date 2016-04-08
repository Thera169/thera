Feature: As a volunteer
  I want to see all of my conversations on the side of my chatbox
  So that I can help as many people as I can simultaneously

Scenario: View all conversations
  Given I have a conversation with "User 1"
  And "User 2" is waiting
  Then I should see "User 2" in "Requests"