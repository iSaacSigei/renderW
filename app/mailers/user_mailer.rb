class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      @url  = 'https://womall.africa/login'
      
      # Attempt to attach the image with error handling
      begin
        attachments['WoMall.png'] = File.read(Rails.root.join('storage', 'WoMall.png'))
      rescue Errno::ENOENT
        Rails.logger.error "Attachment file not found: #{Rails.root.join('storage', 'WoMall.png')}"
        # Optionally, you can handle this by adding a default image or notifying the user
      end
      
      mail(to: @user.email, subject: 'Welcome to WoMall!') do |format|
        format.html { render 'welcome_email' }
      end
    end
  end
  