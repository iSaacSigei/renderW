class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :authenticate_request!, only: [:index, :update, :destroy]
  before_action :authorize_admin, only: [:index, :update, :destroy]

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

  # PUT /users/:id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
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

  def authorize_admin
    render json: { error: 'Access denied' }, status: :forbidden unless @current_user.role == 'admin'
  end
end
