class WelcomeController < ApplicationController
  def index
  end
  def new_survivor
    @user = User.new_survivor()
    sign_in(@user, event: :authentication )
    sign_in @user, :bypass => true 
    #@conversation = @user.generate_conversation
    @conversation = Conversation.create()
    @conversation.messages.build(content: "Your chat has started.",
                                                  conversation_id: @conversation.id)
    @user.conversation = @conversation
    if @conversation
      redirect_to edit_conversation_url(@conversation)
    else
      redirect_to root_path
    end
  end
end