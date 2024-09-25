class ContactMessagesController < ApplicationController
  # GET /contact_messages
  def index
    @contact_messages = ContactMessage.all
    render json: @contact_messages
  end

  # POST /contact_messages
  def create
    @contact_message = ContactMessage.new(contact_message_params)

    if @contact_message.save
      render json: { message: 'Your message has been sent successfully!' }, status: :created
    else
      render json: { errors: @contact_message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /contact_messages/:id
  def destroy
    @contact_message = ContactMessage.find(params[:id])
    
    if @contact_message.destroy
      render json: { message: 'Message deleted successfully!' }, status: :ok
    else
      render json: { error: 'Failed to delete message' }, status: :unprocessable_entity
    end
  end

  private

  def contact_message_params
    params.require(:contact_message).permit(:name, :number, :email, :message)
  end
end
