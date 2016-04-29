Feature: admin permissions
    as an admin I want to be able to manage volunteers
    so that I can maintain oversight
    
Scenario: Manage Volunteers
  Given all roles exist  
  And an admin exists with email "testAdminEmail@test.com" and password "test1234" and name "test admin"
  And I am on the login page
  And I fill in "Email" with "testAdminEmail@test.com"
  And I fill in "Password" with "test1234"
  And I press "Log in"
  Then I should see "Admin Dashboard"
  And I should see "User Listing"
  And I should see "Bad Conversations"
  
Scenario: Volunteer Cannot Manage Volunteers
  Given all roles exist  
  And an admin exists with email "testVolunteerEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  And I fill in "Email" with "testVolunteerEmail@test.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should not see "User Listing"
  
Scenario: Admin Creates a Volunteer
  Given all roles exist  
  And an admin exists with email "testVolunteerEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  And a conversation exists with conversation "Conversation 1" # need to fix
  And I press "Destroy" # need to fix to find right destroy
  Then I should be on the login page
  And I should not see "Conversation 1"