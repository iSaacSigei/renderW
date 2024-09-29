class UserMailer < ApplicationMailer
    default from: 'admin@womall.africa'
  
    def welcome_email(user)
      @user = user
      @url  = 'https://womall.africa/login'  # Link to login page or any relevant page
      mail(to: @user.email, subject: 'Welcome to Womall!')
    end
  end
  