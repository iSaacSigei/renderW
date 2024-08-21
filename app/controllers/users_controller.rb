class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
    before_action :authenticate_request!, only: [:update, :destroy]
  
    # POST /users
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # PUT /users/:id
    def update
      if @current_user.update(user_params)
        render json: @current_user
      else
        render json: @current_user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/:id
    def destroy
      @current_user.destroy
      head :no_content
    end
  
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :name, :email, :contact, :address, :city, :state_province, :password, :password_confirmation)
    end
  end
  