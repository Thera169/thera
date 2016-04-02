class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource


  # GET /users
  # GET /users.json
  def index
    @users = User.all
    authorize! :read, @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @joined_on = @user.created_at.to_formatted_s(:short)
    if @user.current_sign_in_at
      @last_login = @user.current_sign_in_at.to_formatted_s(:short)
    else
      @last_login = "never"
    end
  end

  # GET /users/new
  def new
    @user = User.new()
  end

  # GET /users/1/edit
  def edit_self
    id = params[:id]
    if id.to_i == current_user.id
      @user = current_user
    else
      redirect_to edit_user_path(User.find(id))
    end
  end


  # GET admin/users/1/edit
  def edit
    @user
  end

  # POST /users
  # POST /users.json
  def create
    args = params[:user].clone
    if ["volunteer", "admin"].include?(args[:role_id].downcase)
      args[:role_id] = args[:role_id].slice(0,1).capitalize + args[:role_id].slice(1..-1)
    end
    @user = User.admin_make_user(args)
    respond_to do |format|
      if @user
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                           @user.update(user_params)
                         else
                           @user.update_without_password(user_params)
                         end

    respond_to do |format|
      if successfully_updated
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
  def needs_password?(user, params)
    params[:password].present?
  end

  # DELETE /users/1
  # DELETE /users/1.json

  private
    def needs_password?(user, params)
      params[:password].present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :role_id)
    end
end
