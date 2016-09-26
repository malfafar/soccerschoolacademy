class PlayerNotificationMailer < ApplicationMailer

  def player_called_mail(player, match, message)
    @player = player
    @match = match
    @message = message
    mail(to: @player.player_auth.email, subject: 'You were called to a match.')
  end

end
