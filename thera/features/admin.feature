Feature: all volunteers
	As an admin I want to be able to see all volunteers
	so I can have an overview of the whole volunteer force.
	And I can visually organize them any way I want.
	And they can begin to use the platform.

Scenario: register volunteer
	When I fill out the fields and press the ‘Register Volunteer’ submission button, 
	I am taken to a new page with a table titled ‘All Volunteers’ that shows all existing volunteers.

Scenario: Edit volunteer
	When I click on the ‘Edit Existing Volunteer’ button on the admin homepage, 
	I am redirected to a new page with a search bar.

Scenario: Search volunteer
	When I type in a name (e.g. Kayla Razavi)
	And press the ‘Search’ icon
	I am redirected to a similar form titled ‘Add New Volunteer’ as introduced before.