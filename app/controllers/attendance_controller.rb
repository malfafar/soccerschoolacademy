class AttendanceController < ApplicationController
  before_action :set_team_season, only: [:show]

  before_action :check_permission
  layout 'admin'

  def show
    params.permit(:matches, :practices, :stats)

    @start_date = DateTime.now.beginning_of_month
    @end_date = DateTime.now.end_of_month


    if params.has_key?(:matches) || params.has_key?(:practices)
      if !params[:matches]
        matches = @team_season.away_matches.where(match_date: @start_date..@end_date) + @team_season.home_matches.where(match_date: @start_date..@end_date)
        matches = matches.sort_by{|e| e.match_date}
        @show_matches = false
      else
        matches = []
        @show_matches = true
      end

      if !params[:practices]
        practices = @team_season.practices.where(practice_date: @start_date..@end_date).order(:practice_date)
        @show_practices = false
      else
        practices = []
        @show_practices = true
      end
    else
      matches = @team_season.away_matches.where(match_date: @start_date..@end_date) + @team_season.home_matches.where(match_date: @start_date..@end_date)
      matches = matches.sort_by{|e| e.match_date}
      practices = @team_season.practices.where(practice_date: @start_date..@end_date).order(:practice_date)
    end

    if params.has_key?(:stats) && params[:stats]
      @stat = true
    elsif params.has_key?(:stats) && !params[:stats]
      @stat = false
    end
    if @team_season.permission == 0
      @players = @team_season.players.order(:name)
    else
      if guardian_auth_signed_in?
        @players = @team_season.players.where(guardian_id: current_guardian_auth.id).order(:name)
      elsif player_auth_signed_in?
        @players = @team_season.players.joins(:player_seasons).where("player_seasons.player_id = :p_id", p_id: current_player_auth.player).uniq
      end
    end
    @elements = practices.map{|f| [f.practice_date, false, f.id]}
    @elements = @elements + matches.map{|f| [f.match_date, true, f.id]}
    @elements = @elements.sort_by{|e| e[0]}
  end

  private

    def set_team_season
      @team_season = TeamSeason.find(params[:id])
    end

    def check_permission
      respond_to  do |format|
        if coach_signed_in?
          format.html {redirect_to coach_index_players_path, alert: "You have no permissions to see this"}
        elsif guardian_auth_signed_in?
          format.html {}
        elsif player_auth_signed_in?
          format.html {}
        else
          format.html {redirect_to root_path, alert: "You have no permissions to see this"}
        end
      end
    end
end
