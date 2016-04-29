class WelcomeController < ApplicationController
  def index
  end
  def new_survivor
    @user = User.new_survivor()
    sign_in(@user, event: :authentication )
    sign_in @user, :bypass => true 

    volunteer = User.find_available_volunteer
    @conversation = Conversation.get_conversation(current_user.id, volunteer.id)

    if @conversation
      redirect_to conversation_path(@conversation)
    else
      redirect_to root_path
    end 
  end
end