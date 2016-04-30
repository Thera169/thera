Given /^I am not logged in$/ do
    page.driver.submit :delete, '/users/sign_out', {}
end 

Given /^I am logged in as a[n]? ([a-zA-Z].*)$/ do |role|
    role.downcase!
    if role == "survivor"
        steps %{
            Given a volunteer exists with email "testVolunteerEmail@test.com" and password "test1234" and name "Jack"
            And I am on the home page  
            And I press "Start a Conversation"
        }
    elsif role == "volunteer"
        if not User.exists?(:name => "test_volunteer")
            role = Role.where(name: "Volunteer").first
            admin_user = User.create(:email => "testVolunteerEmail@test.com", :name => "test volunteer",
                                        :role_id => role.id, :password => "test1234")
        end
           steps %{ 
                Given I am on the login page
                And I fill in "Email" with "testVolunteerEmail@test.com"
                And I fill in "Password" with "test1234"
                And I press "Log in"
           }
    elsif role == "admin"
        if not User.exists?(:name => "test_admin")
            role = Role.where(name: "Admin").first
            admin_user = User.create(:email => "testAdminEmail@test.com", :name => "test admin",
                                        :role_id => role.id, :password => "test1234")
        end
         steps %{
                Given I am on the login page
                And I fill in "Email" with "testAdminEmail@test.com"
                And I fill in "Password" with "test1234"
                And I press "Log in"
           }
    end
end


Given /^I start a new conversation$/ do
    steps %{
        Given I am on the home page
        And I press "Start a Conversation"
    }
    test_volunteer = User.create(:name => "test volunteer", :email => "testVolunteerEmail@test.com",
                                    :password => "test1234", :role_id => 2)
    conv = Conversation.create(:sender_id => test_volunteer.id)
    path_to('the conversation page')
end

Given /^I type a message saying "([^"].*)"$/ do |msg|
    page.fill_in 'message_body', :with => msg
    
    steps %{
        And I press "Send"
    }
end

Given /^an admin exists with email "([^"].*)" and password "([^"].*)" and name "([^"].*)"$/ do |mail, pass, user|
    # if User.exists?(email: mail, role_id: 3)
    #         User.where(email: mail).destroy!
    # end
    role=Role.where(name: "Admin").first
    User.create!(:name => user, :role_id => role.id, :email => mail, :password => pass)
end

Given /^a volunteer exists with email "([^"].*)" and password "([^"].*)" and name "([^"].*)"$/ do |mail, pass, user|
    # if User.exists?(email: mail, role_id: 2)
    #     User.where(email: mail).destroy!
    # end
    role=Role.where(name: "Volunteer").first
    User.create!(:name => user, :role_id => role.id, :email => mail, :password => pass)
end

Given /^all roles exist$/ do
    Role.create(:name => "Survivor", :description => "Can create conversations and create and read messages")
    Role.create(:name => "Volunteer", :description => "Can create messages and read any conversations")
    Role.create(:name => "Admin", :description => "Can perform any CRUD operation on any resource")
end

When /^I add the user with the email: "([^"].*)"$/ do |mail|
    
    page.fill_in 'user_name', :with => 'New_Volunteer'
    page.fill_in 'user_email', :with => mail
    page.fill_in 'user_password', :with => 'aaaaaaaa'
    page.fill_in 'user_password_confirmation', :with => 'aaaaaaaa'
    
end

When /^I delete the user with the email: "([^"].*)"$/ do |mail|
    mail.gsub!(/[^A-Za-z0-9]/,'').downcase!
    within('div.' + mail + '_destroy') do
        click_button 'Destroy'
    end
end


When /^I edit the user with the email: "([^"]*)"$/ do |mail|
    new_mail = mail.gsub(/[^A-Za-z0-9]/,'').downcase
    # puts(page.body)
    within('div.' + new_mail + '_edit') do
        click_button 'Edit'
    end
end


When /^(?:|I )press the button: "([^"]*)"$/ do |button|
  find(:xpath, "//input[contains(@value, 'Sign out')]").click()
end

When /^I refresh the page$/ do
    visit [ current_path, page.driver.last_request.env['QUERY_STRING'] ].reject(&:blank?).join('?')
end

When(/^I fill in name_field with "([^"]*)"$/) do |new_name|
  
    page.fill_in 'user_name', :with => new_name
  
end

# page.all(:xpath, '//tr').each do |entry|
#         if entry.has_content mail
            
#         end    
#     end

Given (/^I have a conversation with "([^"]*)"$/) do |user1|
    pending
end

And (/^"([^"]*)" is waiting$/) do |user2|
    pending
end

Then (/^I should see "([^"]*)" in "([^"]*)"$/) do |user2, request_box|
    pending
end

When /^I click on (\d+) stars$/ do |num_stars|
    puts page.body
    choose "rating-input-1-#{num_stars}"
end

Then /^(\d+) stars are saved in the survey$/ do |num_stars|
    pending
end

Given (/^I see "([^"]*)"$/) do |text|
    pending
end

And (/^I type "([^"]*)" in "([^"]*)"$/) do |comment, comment_box|
    pending
end

Given /^I have not submitted a rating$/ do
    pending
end
def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
end

def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
end

Then /^(?:|I )should see "([^"]*)" once the page loads$/ do |text|
  visit current_path
  steps %{
    Then I should see "#{text}"
  }

end