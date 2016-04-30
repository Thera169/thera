Feature: As a volunteer
  I want to see all of my conversations on the side of my chatbox
  So that I can help as many people as I can simultaneously

Scenario: View all conversations
  Given all roles exist
  And I am logged in as a volunteer
  And a survivor exists with email "survivorEmail@test.com" and password "test1234" and name "Jack"
  And a conversation exists between "testVolunteerEmail@test.com" and "survivorEmail@test.com"
  