class CompetitionsController < ApplicationController
  before_action :authenticate_coach!
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

  layout 'admin'


  around_action :skip_bullet, only: [:edit] if Rails.env.development?


  # GET /competitions
  # GET /competitions.json
  def index

    params.permit(:search)

    if session.has_key?(:current_season)
      @current_season = Season.find(session[:current_season])
    else
      @current_season = Season.last
    end

    if params[:search]
      @competitions = Kaminari.paginate_array(Competition.search(params[:search], @current_season)).page(params[:page]).per(30)
    else
      @competitions = @current_season.competitions.page(params[:page]).per(30)
    end
  end

  # GET /competitions/1
  # GET /competitions/1.json
  def show
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
    @season_id = session.has_key?(:current_season) ? Season.find(session[:current_season].to_i) : Season.last.id
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  # POST /competitions.json
  def create
    @competition = Competition.new(competition_params)

    respond_to do |format|
      if @competition.save
        format.html { redirect_to @competition, notice: 'Competition was successfully created.' }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { render :new }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitions/1
  # PATCH/PUT /competitions/1.json
  def update
    respond_to do |format|
      if @competition.update_attributes(competition_params)
        format.html { redirect_to @competition, notice: 'Competition was successfully updated.' }
        format.json { render :show, status: :ok, location: @competition }
      else
        format.html { render :edit }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1
  # DELETE /competitions/1.json
  def destroy
    @competition.destroy
    respond_to do |format|
      format.html { redirect_to competitions_url, notice: 'Competition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def filter_team_seasons
    season = Season.find(params[:id])
    @team_seasons = TeamSeason.where(season_id: season.id)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_params
      params.require(:competition).permit(:nr_teams, :knockout, :name, :season_id, team_season_ids: [])
    end

    def skip_bullet
      Bullet.enable = false
      yield
    ensure
      Bullet.enable = true
    end
end
