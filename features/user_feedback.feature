Feature: As a user
  I want to provide feedback
  So that I can help make the service better

Scenario: Submit rating
  Given all roles exist
  And I am logged in as a survivor
  When I click on 5 stars
  Then I should see "Please enter any comments you'd like to add about your conversation:"

Scenario: Submit comment
  Given all roles exist
  And I am logged in as a survivor
  When I fill in "rating_comment" with "Volunteer provided great advice"
  And I press "Submit"
  Then I should not see "Add Comment"
  And I should see "Survey submitted successfully."

Scenario: Hide comment box
  Given all roles exist
  And I am logged in as a survivor
  Then "Please enter any comments you'd like to add about your conversation:" should be hidden
