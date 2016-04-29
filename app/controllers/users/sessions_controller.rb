class Users::SessionsController < Devise::SessionsController

  before_action :update_online_status, only: [:create]
  before_action :reset_online_status, only: [:destroy]

  def update_online_status
    if current_user != nil
      user = User.find(current_user.id)
      user.update(status: "online")
    else
      flash[:error] = "Invalid email or password."
    end
  end
  
  def reset_online_status
    if current_user != nil
      user = User.find(current_user.id)
      user.update(status: "offline")
    else
      flash[:error] = "Invalid email or password."
    end
  end

  
end
