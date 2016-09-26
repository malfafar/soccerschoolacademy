class ContactMailer < ApplicationMailer
  def contact_email(contact_info)
    @contact_info = contact_info
    mail(from: @contact_info[:email],to: Rails.application.secrets[:mailer_username], subject: 'N10 Academia Contact Form')
  end
end
