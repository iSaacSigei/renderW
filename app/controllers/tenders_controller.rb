class TendersController < ApplicationController
  before_action :authenticate_request!, only: [:create, :update, :destroy,:update_category]
  before_action :ensure_admin_user, only: [:create, :update, :destroy,:update_category]
  before_action :set_tender, only: [:show, :update, :destroy]

  # GET /tenders
  def index
    @tenders = Tender.all
    render json: @tenders, status: :ok
  end

  # GET /tenders/:id
  def show
    render json: @tender, status: :ok
  end

  # POST /tenders
  def create
    @tender = Tender.new(tender_params)
    if @tender.save
      render json: @tender, status: :created
    else
      render json: @tender.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PUT /tenders/:id
  def update
    if @tender.update(tender_params)
      render json: @tender, status: :ok
    else
      render json: @tender.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /tenders/:id
  def destroy
    @tender.destroy
    render json: { message: 'Tender successfully deleted' }, status: :ok
  end
  def update_category
    old_category = update_category_params[:old_category]
    new_category = update_category_params[:new_category]
  
    # Update all tenders with the old category to the new category
    updated_count = Tender.where(category: old_category).update_all(category: new_category)
  
    if updated_count > 0
      render json: { message: 'Category updated successfully', count: updated_count }, status: :ok
    else
      render json: { error: 'Failed to update category' }, status: :unprocessable_entity
    end
  end
  

  private

  def set_tender
    @tender = Tender.find(params[:id])
  end

  def tender_params
    params.require(:tender).permit(:tender_number, :company, :tender_fee, :application_deadline, :category, :tender_description)
  end
  
  def update_category_params
    params.permit(:old_category, :new_category)
  end
  

  def ensure_admin_user
    render json: { error: 'Unauthorized access' }, status: :unauthorized unless @current_user.admin?
  end
end
