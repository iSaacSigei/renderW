class UserMailer < ApplicationMailer
    def welcome_email(user)
      @user = user
      @url  = 'https://womall.africa/login'
      mail(to: @user.email, subject: 'Welcome to WoMall!') do |format|
        format.html { render 'welcome_email' }
      end
    end
  end
  