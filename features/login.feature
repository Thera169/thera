Feature: login
    as an admin or volunteer
    I want to be able to login
    so that I can have admin/login privileges
    
Scenario: Admin Login
  Given all roles exist  
  And an admin exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  When I fill in "Email" with "testAdminEmail@test.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should see "Signed in as John: Admin"
  And I should be on the authenticated home page

Scenario: Volunteer Login
  Given all roles exist  
  And a volunteer exists with email "testVolunteerEmail@test.com" and password "12345678" and name "Alice"
  And I am on the login page
  When I fill in "Email" with "testVolunteerEmail@test.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should see "Signed in as Alice: Volunteer"
  And I should be on the authenticated home page

Scenario: Failed login
  Given all roles exist 
  And a volunteer exists with email "testVolunteerEmail@test.com" and password "12345678" and name "Alice"
  And I am on the login page
  When I fill in "Email" with "123testVolunteerEmail@test.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should see "Invalid email or password."
  And I should be on the login page
  
Scenario: Failed admin password
  Given all roles exist 
  And an admin exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  When I fill in "Email" with "testAdminEmail@test.com"
  And I fill in "Password" with "1234567"
  And I press "Log in"
  Then I should see "Invalid email or password."
  And I should be on the login page
  
Scenario: Failed volunteer password
  Given all roles exist
  And a volunteer exists with email "testVolunteerEmail@test.com" and password "12345678" and name "Alice"
  And I am on the login page
  When I fill in "Email" with "testVolunteerEmail@test.com"
  And I fill in "Password" with "1234567"
  And I press "Log in"
  Then I should see "Invalid email or password."
  And I should be on the login page