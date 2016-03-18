class WelcomeController < ApplicationController
  def index
  end
  def new_survivor
    role = Role.where(:name => "Survivor").first
    pw = (0...8).map { (30 + rand(26)).chr }.join
    email = (0...8).map { (30 + rand(26)).chr }.join 
    @user = User.create(:name => "anon", 
                           :role_id => role.id,
                           :email => email,
                           :password => pw,
                           :password_confirmation => pw)
    @user.save()
    sign_in(@user, event: :authentication )
    sign_in @user, :bypass => true 

    redirect_to root_path
  end
end