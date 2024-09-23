class EventsController < ApplicationController
    before_action :set_event, only: [:show, :update, :destroy]
  
    # GET /events
    def index
      @events = Event.all
      render json: @events
    end
  
    # GET /events/:id
    def show
      render json: @event
    end
  
    # POST /events
    def create
      @event = Event.new(event_params)
      if @event.save
        render json: @event, status: :created
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /events/:id
    def update
      if @event.update(event_params)
        render json: @event
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /events/:id
    def destroy
      @event.destroy
      head :no_content
    end
  
    private
  
    def set_event
      @event = Event.find(params[:id])
    end
  
    def event_params
      params.require(:event).permit(:title, :image, :tag, :profiles, :date, :location, :price, :categories, :link)
    end
  end
  