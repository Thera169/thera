Feature: all users
	As a user I want to start a conversation with a volunteer
	So I can get the help I need
	
Scenario: Start conversation
  Given I am not logged in
  And all roles exist
  And a volunteer exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the home page
  When I start a new conversation
  Then I should see "Rate your conversation here"

Scenario: Sign out and go back to main page
  Given all roles exist
  And a volunteer exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the home page
  And I start a new conversation
  When I follow "Logout"
  Then I should be on the home page
  And I should see "Welcome to Thera"

Scenario: Create message
  Given all roles exist
  And a volunteer exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the home page
  And I start a new conversation
  And I type a message saying "Hey"
  Then I should see "Hey"

Scenario: Go back to main page
  Given all roles exist
  And a volunteer exists with email "testAdminEmail@test.com" and password "12345678" and name "John"
  And I am on the home page
  And I start a new conversation
  When I press "Sign out"
  Then I should be on the home page
  And I should see "Thera"
  
# Scenario: register volunteer
# 	When I fill out the fields and press the ‘Register Volunteer’ submission button, 
# 	Then I am taken to a new page with a table titled ‘All Volunteers’ that shows all existing volunteers.

# Scenario: Edit volunteer
# 	When I click on the ‘Edit Existing Volunteer’ button on the admin homepage, 
# 	Then I am redirected to a new page with a search bar.

# Scenario: Search volunteer
# 	When I type in a name (e.g. Kayla Razavi)
# 	And press the ‘Search’ icon
# 	Then I am redirected to a similar form titled ‘Add New Volunteer’ as introduced before.