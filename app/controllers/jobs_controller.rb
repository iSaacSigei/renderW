class JobsController < ApplicationController
  before_action :authenticate_request!, only: [:create, :update, :destroy]
  before_action :ensure_admin_user, only: [:create, :update, :destroy]
  before_action :set_job, only: [:show, :update, :destroy]

  # GET /jobs
  def index
    if params[:category]
      @jobs = Job.where(category: params[:category])
    else
      @jobs = Job.all
    end

    render json: @jobs, status: :ok
  end

  # GET /jobs/:id
  def show
    render json: @job, status: :ok
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)
    if @job.save
      render json: @job, status: :created
    else
      render json: @job.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PUT /jobs/:id
  def update
    if @job.update(job_params)
      render json: @job, status: :ok
    else
      render json: @job.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/:id
  def destroy
    @job.destroy
    render json: { message: 'Job successfully deleted' }, status: :ok
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:job_title, :category, :job_description, :job_requirements, :application_deadline, :years_of_experience, :job_level, :location)
  end

  def ensure_admin_user
    render json: { error: 'Unauthorized access' }, status: :unauthorized unless @current_user.admin?
  end
end
