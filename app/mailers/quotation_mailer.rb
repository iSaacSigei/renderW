class QuotationMailer < ApplicationMailer
  def send_quotation(quotation)
    @quotation = quotation
    @user = @quotation.admin_user
    @order = @quotation.import_order || @quotation.export_order
    @order_type = @quotation.import_order ? 'import order' : 'export order'

    mail(to: @user.email, subject: 'Your Quotation Has Been Processed')
  end
end
