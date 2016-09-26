module MatchesHelper
  include TeamSeasonsHelper
  def send_called_notification(match, message)
    players = []
    if match.home_team.team.n10
      if !match.home_team.coaches.where(id: current_coach.id).blank?
        match.home_team.players.each do |player|
          if player.statistics.where(match_id: match.id).first.state == state_called_no_answer()
            if player.player_auth
              #PlayerNotificationMailer.player_called_mail(player, match, message).deliver_later
            elsif player.guardian
              if player.guardian.guardian_auth
                #GuardianNotificationMailer.player_called_mail(player, match, message).deliver_later
              elsif
                players << player.name
                # puts "No email for this player guardian".colorize(:red)
              end
            else
              players << player.name
              # puts "No email associated with this player".colorize(:red)
            end
          else
            # puts "Not called".colorize(:red)
          end
        end
        #CoachNotificationMailer.players_called_without_mail(players, current_coach).deliver_later
      else
        # puts "Home team not from coach".colorize(:red)
      end
    else
        # puts "Home team not n10.".colorize(:red)
    end
    if match.away_team.team.n10
      if !match.away_team.coaches.where(id: current_coach.id).blank?
        match.away_team.players.each do |player|
          if player.statistics.where(match_id: match.id).first.state == state_called_no_answer()
            if player.player_auth
              #PlayerNotificationMailer.player_called_mail(player, match, message).deliver_later
            elsif player.guardian
              if player.guardian.guardian_auth
                #GuardianNotificationMailer.player_called_mail(player, match, message).deliver_later
              elsif
                players << player.name
                # puts "No email for this player guardian".colorize(:red)
              end
            else
              players << player.name
              # puts "No email associated with this player".colorize(:red)
            end
          else
            # puts "Not called".colorize(:red)
          end
        end
        #CoachNotificationMailer.players_called_without_mail(players, current_coach).deliver_later
      else
        # puts "Away team not from coach".colorize(:red)
      end
    else
      # puts "Away team not n10.".colorize(:red)
    end
  end
end
