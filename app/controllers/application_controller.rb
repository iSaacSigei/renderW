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
  def ensure_admin_or_current_user
    Rails.logger.info "Current user: #{@current_user.inspect}"
    Rails.logger.info "Requested order ID: #{params[:id]}"
  
    if @current_user.admin?
      # Admins can access all orders
      Rails.logger.info "Admin user #{@current_user.id} accessing all orders"
      return
    end
  
    if params[:id].present?
      # Check if the user owns the specific order
      if @current_user.import_orders.exists?(params[:id]) || @current_user.export_orders.exists?(params[:id])
        Rails.logger.info "User #{@current_user.id} accessing their order ID: #{params[:id]}"
        return
      end
    else
      # For index actions, check if user is authorized to access orders
      if @current_user.import_orders.any? || @current_user.export_orders.any?
        Rails.logger.info "User #{@current_user.id} accessing their orders"
        return
      end
    end
  
    Rails.logger.warn "Unauthorized access attempt by user #{@current_user.id} for order ID: #{params[:id]}"
    render json: { error: 'Unauthorized access' }, status: :unauthorized
  end
  
end
