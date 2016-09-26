class PlayerMatchesController < ApplicationController
  before_action :authenticate_player_auth!
  before_action :set_match, only: [:confirm_call, :deny_call]
  before_action :set_player, only: [:confirm_call, :deny_call]

  include TeamSeasonsHelper
  def deny_call
    @statistic = @match.statistics.where(player_id: @player.id).first
    respond_to do |format|
      if !(@statistic.state < state_called_no_answer())
        if @player.player_auth == current_player_auth
          if @statistic.where(player_id: @player.id).first.update_attributes(state: state_called_denied(), called_confirmation: DateTime.now)
            format.html{ redirect_to player_team_seasons_index_path, notice: "denied with success" }
          else
            format.html{ redirect_to player_team_seasons_index_path, notice: "Error denying" }
          end
        else
          format.html{ redirect_to player_team_seasons_index_path, notice: "You have no permission to deny for this player." }
        end
      else
        puts "Not called"
        format.html{ redirect_to guardian_index_players_path, notice: "The player was not called to the game." }
      end
    end
  end

  def confirm_call
    @statistic = @match.statistics.where(player_id: @player.id).first
    respond_to do |format|
      if @statistic.state < state_called_no_answer()
        if @player.player_auth == current_player_auth
          if @statistic.update_attributes(state: state_called_confirmed(), called_confirmation: DateTime.now)
            format.html{ redirect_to player_team_seasons_index_path, notice: "Confirmed with success" }
          else
            format.html{ redirect_to player_team_seasons_index_path, notice: "Error confirming" }
          end
        else
          format.html{ redirect_to player_team_seasons_index_path, notice: "You have no permission to confirm for this player." }
        end
      else
        format.html{ redirect_to player_team_seasons_index_path, notice: "The player was not called to the game." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:m_id])
    end

    def set_match
      @match = Match.find(params[:m_id])
    end
end
