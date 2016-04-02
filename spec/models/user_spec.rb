require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
    before(:each) do
      Role.create({name: "Survivor", description: "Can create converstations and create and read messages"})
      Role.create({name: "Volunteer", description: "Can create messages and read any conversations"})
      Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})
    end
    describe " #new_survivor" do
        before(:each) do
          mock_role = double("mock survivor role", :id => 1)
          mock_role.should_receive(:id).and_return(1)
          User.should_receive(:get_role).and_return(mock_role)
        #   User.should_receive(:create).and_return(create(:user, :survivor))
        end
        it "creates a user with survivor role id (1)" do
          @user = User.new_survivor
          @user.role_id.should == 1
          @user.destroy!
        end
      end
      describe "admin make admin" do
        before(:each) do
            mock_role = double("Admin mock role")
            allow(mock_role).to receive(:id).and_return(3)
            User.should_receive(:get_role).with("Admin").and_return(mock_role)
        end
        it "should allow the admin to make another admin" do
          @user = User.admin_make_user(:role_id => "Admin", :password_confirmation => "test pass",
                                                    :name => "test name", :password => "test pass",
                                                    :email => "test_email@test.com")
          @user.role_id.should == 3
          @user.destroy!
        end
      end
      describe "admin make volunteer" do
        before(:each) do
            mock_role = double("Volunteer mock role")
            mock_role.should_receive(:id).and_return(2)
            User.should_receive(:get_role).with("Volunteer").and_return(mock_role)
        end
        it "should allow the admin to make a volunteer" do
          @user = User.admin_make_user(:role_id => "Volunteer", :password_confirmation => "test pass",
                                                    :name => "test name", :password => "test pass",
                                                    :email => "test_email@test.com")
          @user.role_id.should == 2
          @user.destroy!
        end
      end
      describe "admin incorrect account creation", :pending => true  do
        # before(:each) do
        #   User.should_receive(:create).and_return(create(:user, :volunteer))
        # end
        it "should return nil with an error message" do
          @user = User.admin_make_user(:role_id => "wrong role ID", :password_confirmation => "test pass",
                                                    :name => "test name", :password => "test pass",
                                                    :email => "test_email@test.com")
          @user.role_id.should == 1
          @user.destroy!
        end
      end
      describe "volunteer check" do
        it "should return true if the user is a volunteer" do
          role_id = Role.where(name: "Volunteer").first.id
          volunteer_user = User.create!(:name => "Mr. Volunteer", :role_id => role_id,
                        :email => "testVolunteerEmail@test.com", :password => "test1234",
                        :password_confirmation => "test1234")
          volunteer_user.volunteer?.should == true
        end
        it "should return false if the user is not a volunteer" do
          role_id = Role.where(name: "Survivor").first.id
          survivor_user = User.create!(:name => "Ms. Survivor", :role_id => role_id,
                            :email => "testSurvivorEmail@test.com", :password => "test1234",
                            :password_confirmation => "test1234")
          survivor_user.volunteer?.should == false
        end
      end
      describe "admin check" do
        it "should return true if the user is an admin" do
          role_id = Role.where(name: "Admin").first.id
          admin_user = User.create!(:name => "Mr. Admin", :role_id => role_id,
                            :email => "testAdminEmail@test.com", :password => "test1234",
                            :password_confirmation => "test1234")
          admin_user.admin?.should == true
        end
        it "should return false if the user is not a volunteer" do
          role_id = Role.where(name: "Survivor").first.id
          survivor_user = User.create!(:name => "Ms. Survivor", :role_id => role_id,
                            :email => "testSurvivorEmail@test.com", :password => "test1234",
                            :password_confirmation => "test1234")
          survivor_user.admin?.should == false
        end
      end
      describe "survivor check" do
        it "should return true if the user is a survivor" do
          role_id = Role.where(name: "Survivor").first.id
          survivor_user = User.create!(:name => "Ms. Survivor", :role_id => role_id,
                            :email => "testSurvivorEmail@test.com", :password => "test1234",
                            :password_confirmation => "test1234")
          survivor_user.survivor?.should == true
        end
        it "should return false if the user is not a volunteer" do
          role_id = Role.where(name: "Admin").first.id
          admin_user = User.create!(:name => "Mr. Admin", :role_id => role_id,
                            :email => "testAdminEmail@test.com", :password => "test1234",
                            :password_confirmation => "test1234")
          admin_user.survivor?.should == false
        end
      end
      describe "conversation generation" do
        before(:each) do
          mock_conv = mock_model(Conversation)
          mock_conv.should_receive(:[]=).with("user_id", 1)
          mock_conv.should_receive(:save).twice.and_return(true)
          mock_conv.should_receive(:did_it_work).and_return(true)
          Conversation.should_receive(:create).and_return(mock_conv)
        end
        it "should create a conversation if the user is an admin", :pending => true  do
          role_id = Role.where(name: "Admin").first.id
          admin_user = User.create!(:name => "Mr. Admin", :role_id => role_id,
                            :email => "testAdminEmail@test.com", :password => "test1234",
                            :password_confirmation => "test1234")
          expect(admin_user.generate_conversation).to_not eq(nil)
        end
        it "should create a conversation if the user is a survivor", :pending => true do
          role_id = Role.where(name: "Survivor").first.id
          survivor_user = User.create!(:name => "Ms. Survivor", :role_id => role_id,
                            :email => "testSurvivorEmail@test.com", :password => "test1234",
                            :password_confirmation => "test1234")
          expect(survivor_user.generate_conversation).to_not eq(nil)
        end
      end
      describe "failed conversation generation" do
        it "should not create a conversation if the user is a volunteer" do
          role_id = Role.where(name: "Volunteer").first.id
          volunteer_user = User.create!(:name => "Mr. Volunteer", :role_id => role_id,
                        :email => "testVolunteerEmail@test.com", :password => "test1234",
                        :password_confirmation => "test1234")
          volunteer_user.generate_conversation.should == nil
        end
      end
end
