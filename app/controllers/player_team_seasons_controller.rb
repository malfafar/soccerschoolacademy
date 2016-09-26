class PlayerTeamSeasonsController < ApplicationController
  before_action :authenticate_player_auth!
  layout 'admin'
  before_action :set_team_season, only: [:show, :update]

  def index
    if session.has_key?(:current_season)
      @current_season = Season.find(session[:current_season])
    else
      @current_season = Season.last
    end

    @team_seasons = current_player_auth.player.team_seasons.where(season_id: @current_season.id).page(params[:page]).per(30)
  end

  def show
  end

  def update
    respond_to do |format|
      if @team_season.update(team_season_params)
        format.html { redirect_to player_team_season_path(@team_season), notice: 'Team season was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_season }
      else
        format.html { render :edit }
        format.json { render json: @team_season.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def set_team_season
    @team_season = TeamSeason.find(params[:id])
  end

  def team_season_params
    params.require(:team_season).permit(:team_id, :season_id, photos_attributes: [:id, :title, :description, :photo,  :approved, :video, :private, :team_season_id, :_destroy])
  end
end
