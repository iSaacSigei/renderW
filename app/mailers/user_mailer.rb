class UserMailer < ApplicationMailer
    default from: 'admin@womall.africa'
  
    def welcome_email(user)
      @user = user
      @url  = 'https://womall.africa/login'
      mail(to: @user.email, subject: 'Welcome to WoMall!')
    end
end
  