class QuotationMailer < ApplicationMailer
  def send_quotation(quotation)
    @quotation = quotation
    @order = @quotation.import_order || @quotation.export_order
    @user = @order.user  # Send email to the user who owns the import/export order
    @order_type = @quotation.import_order ? 'import order' : 'export order'
   # Attach the image
   attachments['WoMall.png'] = File.read(Rails.root.join('storage', 'WoMall.png'))

    mail(to: @user.email, subject: 'Your Quotation Has Been Processed')
  end
end
