class RegistrationsController < Devise::RegistrationsController

  before_action :authenticate_user!
  after_action :update_online_status, only: [:create]

  def update
    user = User.find(current_user.id)
    user.update(thinned_params)
    redirect_to root_path

  end
  

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end


  def update_online_status
    user = User.find(current_user.id)
    user.update(status: "online")
  end

  def updated_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end

  def thinned_params
    updated_params.delete_if do |k, v| 
      v.empty? 
    end
  end



  
  
  
end