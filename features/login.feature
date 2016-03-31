Feature: login
    as an admin or volunteer
    I want to be able to login
    so that I can have admin/login privileges
    
Scenario: Admin Login
  Given an admin exists with email "Admin1" and password "12345678"
  And I am on the login page
  When I fill in "Username:" with "Admin1"
  And I fill in "Password:" with "12345678"
  Then I should see "Login Successful"
  And I should be on the admin page

Scenario: Volunteer Login
  Given a volunteer exists with email "Volunteer1" and password "12345678"
  And I am on the login page
  When I fill in "Username:" with "Volunteer1"
  And I fill in "Password:" with "12345678"
  Then I should see "Login Successful"
  And I should be on the volunteer page

Scenario: Failed admin login
  Given an admin exists with username "Admin1" and password "12345678"
  And I am on the admin login page
  When I fill in "Username:" with "Admin2"
  And I fill in "Password:" with "12345678"
  Then I should see "Login Attempt Failed"
  And I should be on the admin login page

Scenario: Failed volunteer login
  Given a volunteer exists with username "Volunteer1" and password "12345678"
  And I am on the volunteer login page
  When I fill in "Username:" with "Volunteer2"
  And I fill in "Password:" with "12345678"
  Then I should see "Login Attempt Failed"
  And I should be on the volunteer login page
  
Scenario: Failed admin password
  Given an admin exists with username "Admin1" and password "12345678"
  And I am on the admin login page
  When I fill in "Username:" with "Admin1"
  And I fill in "Password:" with "1234567"
  Then I should see "Incorrect Password"
  And I should be on the admin login page
  
Scenario: Failed volunteer password
  Given a volunteer exists with username "Volunteer1" and password "12345678"
  And I am on the volunteer login page
  When I fill in "Username:" with "Volunteer1"
  And I fill in "Password:" with "1234567"
  Then I should see "Incorrect Password"
  And I should be on the volunteer login page