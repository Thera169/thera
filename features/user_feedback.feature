Feature: As a user
  I want to provide feedback
  So that I can help make the service better

Scenario: Submit rating
  When I click on 5 stars
  Then 5 stars are saved in the survey
  And I should see "Add Comment"

Scenario: Submit comment
  Given I see "Add Comment"
  And I type "Volunteer provided great advice" in "Comments Box"
  When I press "Submit"
  Then I should not see "Add Comment"
  And I should see "Your comments have been received"
  And I should see "Edit Comment"

Scenario: Hide comment box
  Given I have not submitted a rating
  Then I should not see "Add Comment"
  