Given /^I am logged in as a ([a-zA-Z].*)$/ do |role|
    role.downcase!
    if role == "survivor"
        steps %{
            Given I am on the home page  
            And I press "Log in"
        }
    elsif role == "volunteer"
        if not User.exists?(:name => "test_volunteer")
            admin_user = User.create(:email => "testVolunteerEmail@test.com", :name => "test volunteer",
                                        :role_id => 2, :password => "test1234")
        end
           steps %{
               Given I am on the admin login page
               And I fill in "Email" with "testVolunteerEmail@test.com"
               And I fill in "Password" with "test1234"
               And I press "Log in"
           }
    elsif role == "admin"
        if not User.exists?(:name => "test_admin")
            admin_user = User.create(:email => "testAdminEmail@test.com", :name => "test admin",
                                        :role_id => 3, :password => "test1234")
        end
         steps %{
               Given I am on the admin login page
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
    conv = Conversation.create(:user_id => test_volunteer.id)
    path_to('the conversation page')
end

Given /^I type a message saying "([^"].*)"$/ do |msg|
    fill_in 'message_content', :with => msg
    steps %{
        And I press "submit message"
    }
end

Given /^an admin exists with email "([^"].*)" and password "([^"].*)" and name "([^"].*)"$/ do |mail, pass, user|
    if User.exists?(email: mail, role_id: 3)
        User.where(email: mail).destroy!
    end
    User.create!(:name => user, :role_id => 3, :email => mail, :password => pass)
end

Given /^a volunteer exists with email "([^"].*)" and password "([^"].*)" and name "([^"].*)"$/ do |mail, pass, user|
    if User.exists?(email: mail, role_id: 2)
        User.where(email: mail).destroy!
    end
    User.create!(:name => user, :role_id => 2, :email => mail, :password => pass)
end

Given /^all roles exist$/ do
    Role.create(:name => "Survivor", :description => "Can create conversations and create and read messages")
    Role.create(:name => "Volunteer", :description => "Can create messages and read any conversations")
    Role.create(:name => "Admin", :description => "Can perform any CRUD operation on any resource")
end

# When /^I delete the user with the email: "([^"].*)"$/ do |mail|
#     page.all(:xpath, '//tr').each do |entry|
#         if entry.has_content mail
            
#         end    
#     end
# end