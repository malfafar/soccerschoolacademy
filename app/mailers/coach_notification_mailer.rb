class CoachNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.coach_notification_mailer.players_called_without_mail.subject
  #
  def players_called_without_mail(players, coach)
    @players = players
    @coach = coach

    mail(to: coach.email, subject: "This players were not warned of the match calling")
  end
end
