Feature: As a user
  I want to be able to edit my user profile
  So I can keep my information up to date
  
Scenario: Edit Admin Self
  Given all roles exist
  And I am logged in as an admin
  And I press "Edit profile"
  Then I should see "Edit My Profile"
  When I fill in name_field with "Thera"
  And I press "Update User"
  Then I should see "User was successfully updated."
  And I should see "Name: Thera"

Scenario: Edit Volunteer Self
  Given all roles exist
  And I am logged in as a volunteer
  And I press "Edit profile"
  Then I should see "Edit My Profile"
  When I fill in name_field with "Thera"
  And I press "Update User"
  Then I should see "User was successfully updated."
  And I should see "Name: Thera"

Scenario: Edit Survivor Self
  Given I am logged in as a survivor
  And I am on the home page
  And all roles exist
  When I start a new conversation
  Then I should not see "Edit My Profile"