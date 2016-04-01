Feature: As an admin
  I want to be able to add, edit and destroy user profiles
  So that I can properly manage the user base 

Scenario: Destroy User
  Given all roles exist  
  And a volunteer exists with email "testvolunteeremail@test.com" and password "12345678" and name "Alice"
  And I am logged in as an admin
  And I follow "Manage Volunteers"
  When I delete the user with the email: "testvolunteeremail@test.com"
  Then I should not see "testvolunteeremail@test.com"

Scenario: Edit User
  Given all roles exist
  And a volunteer exists with email "testvolunteeremail@test.com" and password "12345678" and name "Alice"
  And I am logged in as an admin
  And I follow "Manage Volunteers"
  When I edit the user with the email: "testvolunteeremail@test.com"
  Then I should see "Editing User"
  When I fill in name_field with "New name"
  And I press "Update User"
  Then I should see "User was successfully updated."
  And I should see "Name: New name"
  And I should not see "Name: Alice"
  When I follow "Back"
  Then I should be on the users page
  And I should see "New name"
  And I should not see "Alice"
  
Scenario: Add User
  Given all roles exist
  And I am logged in as an admin
  And I follow "Manage Volunteers"
  And I follow "New User"
  When I add the user with the email: "testvolunteeremail@test.com"
  And I press "Create User"
  Then I should see "New_Volunteer"