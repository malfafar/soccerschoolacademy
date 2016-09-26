module StatisticsHelper


#   def get_player_totals(player, start_date, end_date)
#     #[g(oals), y(ellows), r(eds), o(wn)g(oals), p(layed)]
#     stats = Hash.new
#     get_states_options().each do |state|
#       stats[""+state[1].to_s] = 0
#     end
#     stats[:goals] = 0
#     stats[:yellows] = 0
#     stats[:red] = 0
#     stats[:own_goals] = 0
#     stats[:played] = 0
#     stats[:penalties] = 0
#     stats[:assists] = 0
#     stats[:played_minutes] = 0
#     stats[:stat_late_minutes] = 0
#     stats[:pp_late_minutes] = 0
#     if start_date == nil && end_date == nil
#       @matches = player.matches
#       @practices = player.practices
#     else
#       @matches = player.matches.where(match_date: start_date..end_date)
#       @practices = player.practices.where(practice_date: start_date..end_date)
#     end
#
#     @matches.each do |match|
#       stat = match.statistics.where(player_id: player.id).first
#
#       stats[""+stat.state.to_s] += 1
#       if stat.state == 3
#         stats[""+1.to_s] += 1
#       end
#       stats[:goals] += stat.goals
#
#       if stat.first_yellow
#         stats[:yellows] += 1
#       end
#       if stat.second_yellow
#         stats[:yellows] += 1
#       end
#
#       if stat.red
#         stats[:red] += 1
#       else
#         stats[:red] += 0
#       end
#       stats[:own_goals] += stat.own_goals
#       if stat.called
#         stats[:played] += 1
#       else
#         stats[:played] += 0
#       end
#       stats[:penalties] += stat.penalties
#       stats[:assists] += stat.assists
#       stats[:played_minutes] += stat.played_minutes
#       stats[:stat_late_minutes] += stat.late_minutes
#     end
#
#
#
#     @practices.each do |practice|
#       stat = practice.player_practices.where(player_id: player.id).first
#
#       stats[""+stat.state.to_s] += 1
#       if stat.state == 3
#         stats[""+1.to_s] += 1
#       end
#
#       stats[:pp_late_minutes] += stat.late_minutes
#     end
#
#   return stats
# end
#
#   def get_team_stats(team_season, start_date, end_date)
#     stats = Hash.new
#     stats[:points] = 0
#     stats[:losses] = 0
#     stats[:wins] = 0
#     stats[:draws] = 0
#     stats[:goal_diff] = 0
#     stats[:goals_for] = 0
#     stats[:goals_against] = 0
#     stats[:played] = 0
#
#
#     if start_date == nil && end_date == nil
#       @home_matches = team_season.home_matches
#       @away_matches = team_season.away_matches
#     else
#       @home_matches = team_season.home_matches.where(match_date: start_date..end_date)
#       @away_matches = team_season.away_matches.where(match_date: start_date..end_date)
#     end
#
#
#
#     @home_matches.each do |h_match|
#       if h_match.home_goals == h_match.away_goals
#         stats[:points] += 1
#         stats[:draws] += 1
#       elsif h_match.home_goals > h_match.away_goals
#         stats[:points] += 3
#         stats[:wins] += 1
#       else
#         stats[:losses] += 1
#       end
#       stats[:goals_for] += h_match.home_goals
#       stats[:goals_against] += h_match.away_goals
#     end
#
#     @away_matches.each do |a_match|
#       if a_match.away_goals == a_match.home_goals
#         stats[:points] += 1
#         stats[:draws] += 1
#       elsif a_match.away_goals > a_match.home_goals
#         stats[:points] += 3
#         stats[:wins] += 1
#       else
#         stats[:losses] += 1
#       end
#       stats[:goals_for] += a_match.away_goals
#       stats[:goals_against] += a_match.home_goals
#     end
#
#     stats[:goal_diff] = stats[:goals_for] - stats[:goals_against]
#     stats[:played] = @home_matches.size + @away_matches.size
#
#     return stats
#   end
end
