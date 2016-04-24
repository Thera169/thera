class UsersController < ApplicationController

  # before_action :avatarize, only: [:index]
  before_action :authenticate_user!
  #load_and_authorize_resource

  def index
    if current_user.survivor?
      volunteer = User.find_available_volunteer
      @conversation = Conversation.get_conversation(current_user.id, volunteer.id)
      redirect_to conversation_path(@conversation)
    else
      redirect_to conversations_path
    end
  end

  # def update
  #   binding.pry
  # end

  def admin_page
    @conversations = Conversation.all()
    @users = User.all()
    # dont add 
    # @user = current_user
    # if current_user.sign_in_count == 1 && current_user.avatar.nil?
    #   render "avatar"
    #end
  end


end
