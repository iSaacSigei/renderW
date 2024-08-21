class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:login]
  
    def login
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        token = user.generate_token
        render json: { token: token, user: user.slice(:id, :email, :first_name) }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    def show
      token = request.headers['Authorization']&.split(' ')&.last
      if token
        begin
          decoded_token = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
          user_id = decoded_token[0]['user_id']
          user = User.find_by(id: user_id)
          if user
            render json: { user: user.slice(:id, :email, :first_name) }, status: :ok
          else
            render json: { error: 'User not found' }, status: :unauthorized
          end
        rescue JWT::DecodeError => e
          render json: { error: 'Invalid token' }, status: :unauthorized
        end
      else
        render json: { error: 'No token provided' }, status: :unauthorized
      end
    end
  end
  