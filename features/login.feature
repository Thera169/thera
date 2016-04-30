Feature: login
    as an admin or volunteer
    I want to be able to login
    so that I can have admin/login privileges
    
Scenario: Admin Login and Permissions
  Given all roles exist  
  And an admin exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  When I fill in "Email" with "testAdminEmail@test.com"
  And I fill in "Password" with "12345678"
  And I press "Log in"
  Then I should see "Admin Dashboard"
  And I should be on the admin home page
  And I should see "Bad Conversations"
  And I should see "User Listing"
  And I should see "Add a new Volunteer"

Scenario: Failed Login Nonexisting Email
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
  
Scenario: Failed login due to empty password
  Given all roles exist 
  And an admin exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  When I fill in "Email" with "testAdminEmail@test.com"
  And I fill in "Password" with ""
  And I press "Log in"
  Then I should see "Invalid email or password."
  And I should be on the login page

Scenario: Failed login due to empty email
  Given all roles exist 
  And an admin exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  When I fill in "Email" with ""
  And I fill in "Password" with "1234567"
  And I press "Log in"
  Then I should see "Invalid email or password."
  And I should be on the login page
  
Scenario: Failed login due to empty fields
  Given all roles exist 
  And an admin exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the login page
  When I fill in "Email" with ""
  And I fill in "Password" with ""
  And I press "Log in"
  Then I should see "Invalid email or password."
  And I should be on the login page