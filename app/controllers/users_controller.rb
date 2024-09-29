class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :authenticate_request!, only: [:index, :update, :destroy, :profile]
  before_action :authorize_admin, only: [:index, :update, :destroy]

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      Rails.logger.info "Sending welcome email to: #{@user.email}"
      UserMailer.welcome_email(@user).deliver_now
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
 # GET /users/:id/profile
 def profile
  @user = User.find(params[:id])
  render json: @user
end
  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    if @user.destroy_with_associations
      render json: { message: 'User was successfully deleted.' }, status: :ok
    else
      render json: { error: 'Failed to delete user.' }, status: :unprocessable_entity
    end
  end

  # PATCH /users/:id/update_profile
  def update_profile
    @user = User.find(params[:id])
    if @user.update(user_profile_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH /users/:id/update_password
  def update_password
    @user = User.find(params[:id])
    if @user.authenticate(update_password_params[:current_password]) && @user.update(password: update_password_params[:new_password])
      render json: { message: 'Password updated successfully.' }, status: :ok
    else
      render json: { error: 'Invalid current password or password update failed.' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :name, :email, :contact, :address, :city, :state_province, :password, :password_confirmation, :role)
  end

  def user_profile_params
    params.require(:user).permit(:contact, :address, :city, :state_province)
  end

  def update_password_params
    params.require(:user).permit(:current_password, :new_password)
  end

  def authorize_admin
    render json: { error: 'Access denied' }, status: :forbidden unless @current_user.role == 'admin'
  end
end
