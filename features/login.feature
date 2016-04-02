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
  Then I should see "Signed in as John: Admin"
  And I should be on the authenticated home page
  When I follow "Manage Volunteers"
  Then I should see "Listing Users"
  And I should see "New User"

# Scenario: Volunteer Login and Permissions
#   Given all roles exist  
#   And a volunteer exists with email "testVolunteerEmail@test.com" and password "12345678" and name "Alice"
#   And I am on the login page
#   When I fill in "Email" with "testVolunteerEmail@test.com"
#   And I fill in "Password" with "12345678"
#   And I press "Log in"
#   Then I should see "Signed in as Alice: Volunteer"
#   And I should be on the authenticated home page
#   And I should see "Enter an Existing Conversation"
#   And I should not see "Listing Users"
#   And I should not see "New User" # can't add a user
#   And I should see "Edit Profile"
#   And I should see "Conversation 1" # can see a conversation
#   And I should not see "Edit" # can't edit roles
#   And I should see "Destroy" # can destroy roles

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