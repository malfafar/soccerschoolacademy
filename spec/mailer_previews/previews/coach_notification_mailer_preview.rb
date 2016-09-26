# Preview all emails at http://localhost:3000/rails/mailers/coach_notification_mailer
class CoachNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/coach_notification_mailer/players_called_without_mail
  def players_called_without_mail
    match = Match.last
    players = match.home_team.players
    coach = match.home_team.coaches.last

    CoachNotificationMailer.players_called_without_mail(players, coach)
  end

end
