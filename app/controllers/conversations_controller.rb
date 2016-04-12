class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :authenticate_user!
  load_and_authorize_resource
  # layout false

  def index
    @decorated_conversation = ConversationDecorator.new(current_user)
    @users = User.all
  end

  def create
    if current_user.survivor?
      @conversation = Conversation.get_conversation_survivor(params[:sender_id],params[:recipient_id])
    else
      @conversation = Conversation.get_conversation(params[:sender_id],params[:recipient_id])
    end
    redirect_to conversation_path(@conversation)
  end

  def show
    @users = User.all
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end



  private

    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

    def interlocutor(conversation)
      current_user == conversation.recipient ? conversation.sender : conversation.recipient
    end

end
