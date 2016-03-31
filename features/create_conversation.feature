Feature: all users
	As a user I want to start a conversation with a volunteer
	So I can get the help I need
	
Scenario: Start conversation
  Given I am logged in as a survivor
  And I am on the home page
  When I press "Start a Conversation"
  Then I should see "Your chat has started."

Scenario: Sign out and go back to main page
  Given I am logged in as a survivor
  And I start a new conversation
  When I press "Sign out"
  Then I should be on the home page
  And I should see "Signed out successfully."

Scenario: Create message
  Given I am logged in as a survivor
  And I start a new conversation
  And type a message saying "Hey"
  Then I should see "Hey"
  
#   Given I am on the chat page
#   When I press "Update Conversation"
#   Then I should see "Chatbox"
#   And I fill in "message_box" with "Hey"
#   And I press "submit message"
#   Then I should see "Hey"
  
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