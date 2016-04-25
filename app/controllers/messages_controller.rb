class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages = Message.where(conversation_id: @conversation.id)
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!
    @path = conversation_path(@conversation)    
    rip = @conversation.recipient
    @sender_id = current_user.id
    @notification_path = "/notifications/" + rip.id.to_s
    PrivatePub.publish_to("/notifications/" + rip.id.to_s, :sender_id => current_user.id)
    puts(@notification_path)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
