class ApplicationMailer < ActionMailer::Base
  default from: 'WoMall <admin@womall.africa>', 
          reply_to: 'admin@womall.africa'

  layout "mailer"
end
