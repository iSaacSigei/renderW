class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      @url  = 'https://womall.africa/login'
      # Attach the image
      attachments['WoMall.png'] = File.read(Rails.root.join('storage', 'WoMall.png'))
      mail(to: @user.email, subject: 'Welcome to WoMall!') do |format|
        format.html { render 'welcome_email' }
      end
    end
  end
  