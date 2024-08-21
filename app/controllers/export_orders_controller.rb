class ExportOrdersController < ApplicationController
  before_action :authenticate_request!

  # POST /export_orders
  def create
    @export_order = @current_user.export_orders.new(export_order_params)
  
    if @export_order.save
      # If images are attached, log or verify them
      if @export_order.images.attached?
        Rails.logger.info "Images attached: #{@export_order.images.map(&:filename).join(', ')}"
      end
      render json: @export_order, status: :created
    else
      render json: @export_order.errors, status: :unprocessable_entity
    end
  end
  

  # GET /export_orders
  def index
    @export_orders = @current_user.export_orders

    export_orders_with_images = @export_orders.map do |export_order|
      export_order.as_json.merge(images: export_order.images.map { |image| url_for(image) })
    end

    render json: export_orders_with_images, status: :ok
  end

  # GET /export_orders/:id
  def show
    export_order = @current_user.export_orders.find(params[:id])
    render json: export_order.as_json.merge(images: export_order.images.map { |image| url_for(image) })
  end

  private

  def export_order_params
    params.require(:export_order).permit(
      :export_to, :product, :units, :product_description,
      :company_name, :address, :city, :state_province, :contact,
      :request_quotation, images: []
    )
  end
end
