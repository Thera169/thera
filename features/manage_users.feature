Feature: As an admin
  I want to be able to add, edit and destroy user profiles
  So that I can properly manage the user base 

Scenario: Destroy User
  Given all roles exist  
  And a volunteer exists with email "testVolunteerEmail@test.com" and password "12345678" and name "Alice"
  And I am logged in as an admin
  And I follow "Manage Volunteers"
  When I delete the user with the email: "testVolunteerEmail@test.com"
  