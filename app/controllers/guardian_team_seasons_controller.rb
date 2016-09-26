class GuardianTeamSeasonsController < ApplicationController
  layout 'admin'

  before_action :authenticate_guardian_auth!
  before_action :set_team_season, only: [:show, :update]

  def index


    params.permit(:search)

    if session.has_key?(:current_season)
      @current_season = Season.find(session[:current_season])
    else
      @current_season = Season.last
    end


    @team_seasons = []
    current_guardian_auth.guardian.players.each do |player|
      player.team_seasons.where(season_id: @current_season.id).each do |team_season|
        @team_seasons << team_season
      end
    end
    @team_seasons = @team_seasons.uniq
    @team_seasons = Kaminari.paginate_array(@team_seasons).page(params[:page]).per(30)
  end

  def show
  end

  def update
    respond_to do |format|
      if @team_season.update(team_season_params)
        format.html { redirect_to guardian_team_season_path(@team_season), notice: 'Team season was successfully updated.' }
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
    params.require(:team_season).permit(:team_id, :season_id, photos_attributes: [:id, :title, :description, :photo,  :approved, :private, :team_season_id, :_destroy, :level])
  end
end
