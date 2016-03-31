require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
            mock_role.should_receive(:id).and_return(3)
            User.should_receive(:get_role).with("Admin").and_return(mock_role)
        end
        it "should allow the admin to make another admin" do
          @user = User.admin_make_user(:role_id => "admin", :password_confirmation => "test pass",
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
          @user = User.admin_make_user(:role_id => "volunteer", :password_confirmation => "test pass",
                                                    :name => "test name", :password => "test pass",
                                                    :email => "test_email@test.com")
          @user.role_id.should == 2
          @user.destroy!
        end
      end
      describe "admin incorrect account creation" do
        # before(:each) do
        #   User.should_receive(:create).and_return(create(:user, :volunteer))
        # end
        it "should return nil with an error message" do
          @user = User.admin_make_user(:role_id => "wrong role ID", :password_confirmation => "test pass",
                                                    :name => "test name", :password => "test pass",
                                                    :email => "test_email@test.com")
          @user.should be_nil
          @user.destroy!
        end
      end
end