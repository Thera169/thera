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
  And a volunteer exists with email "testVolunteerEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  And I fill in "Email" with "testVolunteerEmail@test.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should not see "User Listing"
  
Scenario: Admin Creates a Volunteer
  Given all roles exist  
  And an admin exists with email "testAdminEmail2@test.com" and password "12345678" and name "John"
  And a volunteer exists with email "testVolunteer2Email@test.com" and password "12345678" and name "Sue"
  And I am on the login page
  And I fill in "Email" with "testAdminEmail2@test.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should see "Sue"
  When I delete the user with the email "testVolunteerEmail2@test.com"
  Then I should be on the admin page
  And I should not see "Sue"