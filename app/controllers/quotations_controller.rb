class QuotationsController < ApplicationController
  before_action :authenticate_request!
  before_action :ensure_admin_user, only: [:create]
  before_action :find_quotation, only: [:show]
  before_action :ensure_user_owns_quotation, only: [:show]

  def create
    quotation_params = params.require(:quotation).permit(:price_per_unit, :custom_clearance_fee, :logistics_fee, :warehouse_fee, :import_order_id, :export_order_id)
  
    @quotation = Quotation.new(quotation_params)
    @quotation.admin_user = @current_user
  
    if params[:quotation][:import_order_id]
      import_order = ImportOrder.find(params[:quotation][:import_order_id])
      units = import_order.units
      @quotation.import_order = import_order
    elsif params[:quotation][:export_order_id]
      export_order = ExportOrder.find(params[:quotation][:export_order_id])
      units = export_order.units
      @quotation.export_order = export_order
    else
      render json: { error: 'Order not specified' }, status: :unprocessable_entity and return
    end
  
    total_price_per_unit = @quotation.price_per_unit.to_f * units
  
    # Calculate subtotal and total including company commission
    subtotal, total = calculate_total(total_price_per_unit, @quotation)
    @quotation.total = total
  
    if @quotation.save
      QuotationMailer.send_quotation(@quotation).deliver_later
      render json: { 
        message: 'Quotation successfully created and email sent', 
        quotation: @quotation,
        subtotal: subtotal,
        total: total,
        units: units
      }, status: :created
    else
      render json: { errors: @quotation.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def index
    @quotations = Quotation.joins("LEFT JOIN import_orders ON import_orders.id = quotations.import_order_id")
                           .joins("LEFT JOIN export_orders ON export_orders.id = quotations.export_order_id")
                           .where("import_orders.user_id = ? OR export_orders.user_id = ?", @current_user.id, @current_user.id)
  
    render json: @quotations
  end
  
  def show
    render json: @quotation
  end

  private

  def ensure_admin_user
    unless @current_user&.role == 'admin'
      render json: { error: 'Unauthorized access' }, status: :unauthorized
    end
  end

  def find_quotation
    @quotation = Quotation.find(params[:id])
  end
  
  def ensure_user_owns_quotation
    if !(@quotation.import_order&.user == @current_user) && !(@quotation.export_order&.user == @current_user)
      render json: { error: 'Unauthorized access' }, status: :unauthorized
    end
  end
  
  def calculate_total(total_price_per_unit, quotation)
    additional_fees = quotation.custom_clearance_fee.to_f + quotation.logistics_fee.to_f + quotation.warehouse_fee.to_f
    subtotal = total_price_per_unit + additional_fees
    company_commission = 0.05 * subtotal
    quotation.company_commission = company_commission
    total = subtotal + company_commission
    
    [subtotal, total]
  end
  
end
