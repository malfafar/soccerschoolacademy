class GuardianAuthMatchesController < ApplicationController


  before_action :authenticate_guardian_auth!

  before_action :set_player, only: [:confirm_call, :deny_call]
  before_action :set_match, only: [:update]


  include TeamSeasonsHelper
  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update

    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to :back , notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end


  def deny_call

    @match = Match.find(params[:m_id])
    @statistic = @match.statistics.where(player_id: @player.id).first
    respond_to do |format|
      if !(@statistic.state < state_called_no_answer())
        if @player.guardian.guardian_auth == current_guardian_auth
          if @statistic.where(player_id: @player.id).first.update_attributes(state: state_called_denied(), called_confirmation: DateTime.now)
            format.html{ redirect_to guardian_index_players_path, notice: "Denied with success" }
          else
            format.html{ redirect_to guardian_index_players_path, notice: "Error denying" }
          end
        else
          format.html{ redirect_to guardian_index_players_path, notice: "You have no permission to deny for this player." }
        end
      else
        puts "Not called"
        format.html{ redirect_to guardian_index_players_path, notice: "The player was not called to the game." }
      end
    end
  end

  def confirm_call
    puts "Deny".colorize(:red)
    @match = Match.find(params[:m_id])
    @statistic = @match.statistics.where(player_id: @player.id).first
    respond_to do |format|
      puts @statistic.state
      if !(@statistic.state < state_called_no_answer())
        if @player.guardian.guardian_auth == current_guardian_auth
          if @statistic.update_attributes(state: state_called_confirmed(), called_confirmation: DateTime.now)
            format.html{ redirect_to guardian_index_players_path, notice: "Confirmed with success" }
          else
            format.html{ redirect_to guardian_index_players_path, notice: "Error confirming" }
          end
        else
          format.html{ redirect_to guardian_index_players_path, notice: "You have no permission to confirm for this player." }
        end
      else
        puts "Not called"
        format.html{ redirect_to guardian_index_players_path, notice: "The player was not called to the game." }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
        params.require(:match).permit(photos_attributes: [:id, :title, :description, :match_id, :photo, :approved, :private, :_destroy])
    end


end
