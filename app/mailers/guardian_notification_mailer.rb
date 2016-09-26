class GuardianNotificationMailer < ApplicationMailer

  def player_called_mail(player, match, message)
    @player = player
    @match = match
    @message = message
    mail(to: @player.guardian.guardian_auth.email, subject: 'One of your players was called to a match.')
  end
end
