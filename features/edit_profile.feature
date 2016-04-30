Feature: As a user
  I want to be able to edit my user profile
  So I can keep my information up to date
  
Scenario: Edit Admin Self
  Given all roles exist
  And I am logged in as an admin
  And I edit the user with the email: "testAdminEmail@test.com"
  When I fill in name_field with "Thera"
  And I press "Update User"
  Then I should see "User was successfully updated."
  And I should see "Name: Thera"
