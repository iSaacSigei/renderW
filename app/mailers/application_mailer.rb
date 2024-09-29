class ApplicationMailer < ActionMailer::Base
  default from: 'admin@womall.africa', 
  reply_to: 'admin@womall.africa', 
  headers: { 'X-SMTPAPI' => { 'filters' => { 'templates' => { 'settings' => { 'from' => { 'name' => 'WoMall' } } } } } } }

  layout "mailer"
end
