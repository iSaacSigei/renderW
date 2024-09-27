class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update_profile, :update_password, :destroy]
  before_action :authenticate_request!, only: [:index, :update_profile, :update_password, :destroy]
  before_action :authorize_admin, only: [:index, :destroy]

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
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

  # PATCH /users/:id/update_profile
  def update_profile
    @user = User.find(params[:id])
    if @user.update(profile_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /users/:id/update_password
  def update_password
    @user = User.find(params[:id])
    if @user.authenticate(params[:current_password]) && @user.update(password_params)
      render json: { message: 'Password updated successfully' }
    else
      render json: { errors: ['Invalid current password or update failed'] }, status: :unprocessable_entity
    end
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :name, :email, :contact, :address, :city, :state_province, :password, :password_confirmation, :role)
  end

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :name, :contact, :address, :city, :state_province)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
