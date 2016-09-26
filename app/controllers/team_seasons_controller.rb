class TeamSeasonsController < ApplicationController
  before_action :authenticate_coach!
  layout 'admin'
  before_action :set_team_season, only: [:show, :edit, :update, :destroy, :attendance]
  before_action :check_is_coach, only: [:edit]
  # GET /team_seasons
  # GET /team_seasons.json
  def index

    params.permit(:search)

    if session.has_key?(:current_season)
      @season = Season.find(session[:current_season])
    else
      @season = Season.last
    end

    if params[:search]
      @team_seasons = Kaminari.paginate_array(current_coach.team_seasons.includes(:team, :season).search(params[:search], @season)).page(params[:page]).per(30)
    else
      @team_seasons = current_coach.team_seasons.includes(:team, :season).where(season_id: @current_season.id).page(params[:page]).per(30)
    end
  end

  def attendance
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

    @players = @team_season.players.order(:name)
    @elements = practices.map{|f| [f.practice_date, false, f.id]}
    @elements = @elements + matches.map{|f| [f.match_date, true, f.id]}
    @elements = @elements.sort_by{|e| e[0]}


  end

  def get_team_level
     @level = Team.find(params[:id]).level
  end

  # GET /team_seasons/1
  # GET /team_seasons/1.json
  def show

  end

  # GET /team_seasons/new
  def new
    @team_season = TeamSeason.new
  end

  # GET /team_seasons/1/edit
  def edit
  end

  # POST /team_seasons
  # POST /team_seasons.json
  def create
    @team_season = TeamSeason.new(team_season_params)

    respond_to do |format|
      if @team_season.save
        format.html { redirect_to @team_season, notice: 'Team season was successfully created.' }
        format.json { render :show, status: :created, location: @team_season }
      else
        format.html { render :new }
        format.json { render json: @team_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_seasons/1
  # PATCH/PUT /team_seasons/1.json
  def update
    # if team_season_params.has_key?(:photos_attributes)
      # team_season_params[:photos_attributes].each do |photo|
        # @photo.team_season.photos.each do |photo|
        #   photo.update_attributes(main: false)
        # end
      # end
    # end
    respond_to do |format|
      if @team_season.update(team_season_params)
        format.html { redirect_to @team_season, notice: 'Team season was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_season }
      else
        format.html { render :edit }
        format.json { render json: @team_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_seasons/1
  # DELETE /team_seasons/1.json
  def destroy
    @team_season.destroy
    respond_to do |format|
      format.html { redirect_to team_seasons_url, notice: 'Team season was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_is_coach
      if !@team_season.coaches.exists?(current_coach.id)
        flash[:notice] = "This team is not yours!"
        redirect_to team_seasons_path
      end
    end

    def set_team_season
      @team_season = TeamSeason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_season_params
      params.require(:team_season).permit(:team_id, :season_id, :photo, :icon, :permission, player_seasons_attributes:[:shirt_number, :shoe_size, :shirt_name, :player_id, :_destroy,:id], coach_ids: [], photos_attributes: [:id, :title, :description, :match_id, :photo, :level, :approved, :main, :video, :video_url,  :private,  :_destroy])
    end
end
