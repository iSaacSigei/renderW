class QuotationMailer < ApplicationMailer
  default from: 'WoMall <admin@womall.africa>', 
  reply_to: 'admin@womall.africa'

  def send_quotation(quotation)
    @quotation = quotation
    @order = @quotation.import_order || @quotation.export_order
    @user = @order.user  # Send email to the user who owns the import/export order
    @order_type = @quotation.import_order ? 'import order' : 'export order'
    
    # Attempt to attach the image with error handling
    begin
      attachments['WoMall.png'] = File.read(Rails.root.join('storage', 'WoMall.png'))
    rescue Errno::ENOENT
      Rails.logger.error "Attachment file not found: #{Rails.root.join('storage', 'WoMall.png')}"
      # Optionally, handle the error, such as providing a default image or notifying the user
    end

    mail(to: @user.email, subject: 'Your Quotation Has Been Processed')
  end
end
