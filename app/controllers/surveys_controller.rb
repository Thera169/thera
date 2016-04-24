class SurveysController < ApplicationController
	before_filter :authenticate_user!
  	before_action :authenticate_user!

  	def create
      @conversation = Conversation.find(params["conversation_id"])
  		if params["rating-input-1"].nil?
  			return
  		end
  		if Survey.create({:rating => params["rating-input-1"], :text => params["comment_name"], :conversation =>  @conversation})
  		  flash[:notice] = "Survey submitted successfully. Thank you for your feedback!"
      else
        flash[:error] = "There was an issue submitting your survey, please try again."
      end
      if params[:save_conversation] == "yes"
  			#make sure to not delete conversation when this is implemented properly
  		end
      redirect_to conversation_path(@conversation)
  	end
end
