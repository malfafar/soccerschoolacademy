# Preview all emails at http://localhost:3000/rails/mailers/admin_notifier
class AdminNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_notifier/order_failed
  def players_called_without_mail
    players = ["Joao", "Manuel", "Pinto"]
    coach = Coach.first
    CoachNotificationMailer.players_called_without_mail(players, coach)
  end

end
