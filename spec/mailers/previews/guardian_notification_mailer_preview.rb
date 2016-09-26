# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class GuardianNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/referral_accepted
  def player_called_mail
    player = Player.first
    match = Match.first
    message = "O jogador foi convocado para um jogo a decorrer no dia 30-02-2015 nas instalações do Clube de Santa Clara B, junto ao convento e mosteiro."
    GuardianNotificationMailer.player_called_mail(player, match, message)
  end


end
