class ApplicationController < ActionController::Base
  before_action :authenticate_request!, if: -> { request.headers['Authorization'].present? }

  private

  def authenticate_request!
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
      @current_user = User.find(decoded['user_id'])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { errors: 'Invalid token' }, status: :unauthorized
    end
  end
end
