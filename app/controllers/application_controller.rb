class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_action :update_last_seen
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied to this resource!"
    redirect_to root_url
  end

  def update_last_seen
    current_user.update(last_seen: Time.now) if current_user
  end

  helper_method :update_last_seen



end
