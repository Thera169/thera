class Users::SessionsController < Devise::SessionsController

  before_action :update_online_status, only: [:create]
  before_action :reset_online_status, only: [:destroy]

  def update_online_status
    user = User.find(current_user.id)
    user.update(status: "online")
  end
  
  def reset_online_status
    user = User.find(current_user.id)
    user.update(status: "offline")
  end

  
end
