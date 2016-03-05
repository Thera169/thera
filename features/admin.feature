Feature: all volunteers
	As an admin I want to be able to see all volunteers
	So I can have an overview of the whole volunteer force.


Scenario: register volunteer
	When I fill out the fields and press the ‘Register Volunteer’ submission button, 
	Then I am taken to a new page with a table titled ‘All Volunteers’ that shows all existing volunteers.

Scenario: Edit volunteer
	When I click on the ‘Edit Existing Volunteer’ button on the admin homepage, 
	Then I am redirected to a new page with a search bar.

Scenario: Search volunteer
	When I type in a name (e.g. Kayla Razavi)
	And press the ‘Search’ icon
	Then I am redirected to a similar form titled ‘Add New Volunteer’ as introduced before.