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
    conv_id = Conversation.all.last.id.to_s
    visit 'conversations/' + conv_id + '/edit'
end

Given /^I type a message saying "([^"].*)"$/ do |msg|
    fill_in 'message_content', :with => msg
    steps %{
        And I press "submit message"
    }
end

Given /^an admin exists with email "([^"].*)" and password "([^"].*)"$/ do |mail, pass|
    if User.exists?(email: mail)
        User.where(email: mail).first.destroy!
    end
    User.create!(:name => "test admin",:email => mail , :role_id => 3, :password => pass)
end

Given /^a volunteer exists with email "([^"].*)" and password "([^"].*)"$/ do |mail, pass|
    if User.exists?(email: mail)
        User.where(email: mail).first.destroy!
    end
    User.create!(:name => "test volunteer", :email => mail , :role_id => 2, :password => pass)
end