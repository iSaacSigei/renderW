class TendersController < ApplicationController
  before_action :authenticate_request!, only: [:create, :update, :destroy]
  before_action :ensure_admin_user, only: [:create, :update, :destroy]
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

  private

  def set_tender
    @tender = Tender.find(params[:id])
  end

  def tender_params
    params.require(:tender).permit(:tender_number, :company, :tender_fee, :application_deadline, :category, :tender_description)
  end

  def ensure_admin_user
    render json: { error: 'Unauthorized access' }, status: :unauthorized unless @current_user.admin?
  end
end
