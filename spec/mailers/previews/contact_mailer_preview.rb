# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/referral_accepted
  def contact_email

    contact_info = { :email => 'joaoribeirost@gmail.com' }
    ContactMailer.contact_email(contact_info)
  end


end
