class WelcomeController < ApplicationController
  def index
  end
  def new_survivor
    @user = User.new_survivor()
    sign_in(@user, event: :authentication )
    sign_in @user, :bypass => true 

    volunteer = User.find_available_volunteer

    if volunteer == nil
      puts "/n/n/n/n"
      puts "FUUUUUUUUUUCK"
      puts "/n/n/n/n"
      sign_out(@user)
      flash[:no_volunteers] = "No volunteers are available at this time."
      redirect_to "/"
    else
      @conversation = Conversation.get_conversation(current_user.id, volunteer.id)
      if @conversation
        puts "/n/n/n/n"
        puts "PEWP"
        puts "/n/n/n/n"
        redirect_to conversation_path(@conversation)
      else
        puts "/n/n/n/n"
        puts "PLEASE LET ME DONE"
        puts "/n/n/n/n"
        redirect_to "/"
      end
    end 
  end
end