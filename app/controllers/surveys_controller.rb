class SurveysController < ApplicationController
	before_filter :authenticate_user!
  	before_action :authenticate_user!

  	def create
  		if params["rating-input-1"].nil?
  			return
  		end
  		Survey.create({rating: => params["rating-input-1"], text: => params[], conversation: @conversation})
  		if params[:save_conversation] == "save_confirm"
  			#make sure to not delete conversation when this is implemented properly
  		end
  	end
end
