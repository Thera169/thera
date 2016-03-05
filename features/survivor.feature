Feature: begin chat
	As a user I want to begin a chat
	So that I can get paired with a volunteer

Scenario: begin chat
	When I click on ‘Start Session’
	Then I should see the waiting page

# Scenario: select Message Box
# 	When I select "Message Box"
# 	And I type "Hello Volunteer"
# 	And I press Enter
# 	Then I should see "Hello Volunteer" in "Conversation Box"
# 	And the volunteer should see "Hello Volunteer" in "Conversation Box"

# Feature: getting service needed
# 	As a user I want to be sure that I will speak to a volunteer
# 	So that I know I am getting the service I need

# Scenario: given service
# 	Given I am on the waiting page
# 	Then I should see "You will be connecting with a volunteer shortly"


# Feature: Give feedback
# 	As a user I want to provide feedback
# 	So that I can help make the service better

# Scenario: give feedback
# 	When I click on X number of stars in the "Stars Box"
# 	Then X stars are saved in the survey
# 	And I should see "Add Comment"

# Scenario: feedback distraction 
# 	Given no stars in the "Stars Box"
# 	Then I should not see "Add Comment"

# Scenario: add feedback comment
# 	When I see "Add Comment" 
# 	Then I type "Volunteer provided great advice" in "Comments Box"
# 	And I press "Send"
# 	Then I should not see "Add Comment"
# 	And I should see “Your comments have been received”
# 	And I should see "Edit comment"

