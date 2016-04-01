require 'rails_helper'
# require 'factory_girl'

describe WelcomeController, type: :controller do
     describe 'making a new survivor' do
         before(:each) do
            mock_conv = double("conversation1", id: 123456789)
            mock_user = double("user1")
            mock_user.should_receive(:id).and_return(1)
            Conversation.should_receive(:create).and_return(mock_conv)
            User.should_receive(:new_survivor).and_return(mock_user)
            mock_messages = double("messages1")
            mock_messages.should_receive(:build).with("Your chat has started.", 123456789).and_return(true)
            mock_conv.should_receive(:messages)
            #   need to .stub!() the sign_in method
        end
        it 'should redirect to conversations when successful' do
            post 'new_survivor' 
            response.should redirect_to('/conversations/123456789/edit')
        end
    end
    describe 'unsuccessful new survivor creation' do
        before(:each) do
          mock_conv = double("conversation1", id: 123456789)
          mock_user = double("user1")
          Conversation.should_receive(:create).and_return(false)
          User.should_receive(:new_survivor).and_return(create(:user, :survivor))
        #   need to .stub!() the sign_in method
        end
        it 'should redirect to root when unsuccessful' do
            post 'new_survivor' 
            response.should redirect_to(root_path)
        end
    end
    describe 'authorizing survivor' do
        it 'should allow an authenticated survivor to enter a conversation'
    end
    describe 'admin login' do
        it 'should allow access to conversations page'
    end
end
            
