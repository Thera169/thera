Feature: all users
	As a user I want to start a conversation with a volunteer
	So I can get the help I need
	
Scenario: Start conversation
  Given I am on the home page
  Then I should see "Thera"
  And I should see "Enter an existing conversation"
  When I follow "Start a Conversation"
  Then I should see "New Conversation"

Scenario: Create conversation
  Given I am on the new conversation page
  Then I should see "New Conversation"
  When I follow "Back"
  Then I should be on the conversation page
  When I follow "Start a Conversation"
  And I press "Create Conversation"
  And I fill in "message_box" with "Hey"
  And I press "Submit"
  Then I should see "Hey"
  
#  Scenario: Create message
   


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