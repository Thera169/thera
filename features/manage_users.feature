Feature: As an admin
  I want to be able to add, edit and destroy user profiles
  So that I can properly manage the user base 

Scenario: Destroy User
  Given all roles exist  
  And a volunteer exists with email "testVolunteerEmail@test.com" and password "12345678" and name "Alice"
  And I am logged in as an admin
  And I follow "Manage Volunteers"
  When I delete the user with the email: "testVolunteerEmail@test.com"
  Then I should not see "testVolunteerEmail@test.com"

Scenario: Edit User
  Given all roles exist
  And I am logged in as an admin
  And I follow "Manage Volunteers"
  And a volunteer exists with email "testVolunteerEmail@test.com" and password "12345678" and name "Alice"
  When I edit the user with the email: "testVolunteerEmail@test.com" # write step definitions
  Then I should see "Editing User"
  When I fill in name_field with "testVolunteer@test.com" # fix name_field
  And I press "Update User"
  Then I should see "User was successfully updated."
  And I should see "Email: testVolunteer@test.com"
  And I should not see "Email: testVolunteerEmail@test.com"
  When I press "Back"
  Then I should be on the authenticated home page
  And I should see "testVolunteer@test.com"
  And I should not see "testVolunteerEmail@test.com"
  
Scenario: Add User
  Given all roles exist
  And I am logged in as an admin
  And I follow "Manage Volunteers"
  And I follow "New User"
  When I add the user with the email: "testVolunteerEmail@test.com"
  And I press "Create User"
  Then I should see "New_Volunteer"