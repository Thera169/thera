Feature: Volunteer login
	As a volunteer I want to login
	So I can provide support to survivors

Scenario: login page
	Given I am on the login page
	And I type "volunteer1" in "Username Box"
	And I type "word" in "Password Box"
	And I click "Login"
	Then I should see the messenger page
	And I should see "Requests"
	And I should not see the "Stars Box"



Scenario: Mutliple chat tabs
	Given I have a conversation with "User 1"
	And "User 2" is waiting
	Then I should see "User 2" in "Requests Box"
	And the "User 2" request should be highlighted blue
	And the "User 1" request should be white


Scenario: switch chats
	Given I have a conversation with "User 1"
	And "User 2" is waiting
	Then "User 2" should be unread

Scenario: Maintain conversations
	Given I have a conversation with "User 1"
	And I have a conversation with "User 2"
	And I have a conversation with "User 3"
	And "User 3" messaged me first
	And "User 2" messaged me second
	And "User 1" messaged me last
	Then "User 3" request should be under "User 2" request
	And "User 2" request should be under "User 1" request
