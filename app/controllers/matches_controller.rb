class MatchesController < ApplicationController

  before_action :authenticate_coach!

  layout "admin"
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  include MatchesHelper
  # GET /matches
  # GET /matches.json
  def index

    params.permit(:search)

    if session.has_key?(:current_season)
      @current_season = Season.find(session[:current_season])
    else
      @current_season = Season.last
    end

    if params[:search]
      @matches = Kaminari.paginate_array(Match.search(params[:search], @current_season)).page(params[:page]).per(30)
    else
      @matches = []
      @current_season.team_seasons.each do |team_season|
        team_season.home_matches.includes(:home_team, :away_team).each do |h_match|
          @matches << h_match
        end
        team_season.away_matches.includes(:home_team, :away_team).each do |a_match|
          @matches << a_match
        end
      end

      @matches = @matches.uniq
      @matches = @matches.sort_by { |k| k[:match_date] }.reverse!
      @matches = Kaminari.paginate_array(@matches).page(params[:page]).per(30)
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
    @season = session.has_key?(:current_season) ? Season.find(session[:current_season].to_i) : Season.last
    puts @season.inspect.colorize(:red)
  end

  # GET /matches/1/edit
  def edit

    @home_team = @match.home_team
    @away_team = @match.away_team
    @message ="Foi convocado para o jogo " + @home_team.team.name + " vs " + @away_team.team.name + "! \nPara aceitar ou rejeitar esta convocatória deverá seguir um dos links que se encontra no fundo deste email. O jogo será realizado no dia "
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.create(match_params)
    respond_to do |format|

      if @match.persisted?
        @match.home_team.players.each do |player|
          @match.players << player
        end

        @match.away_team.players.each do |player|
          @match.players << player
          stat = @match.statistics.where(player_id: player.id).first
          stat.home = false
          stat.save
        end

        if @match.save

          format.html { redirect_to @match, notice: 'Match was successfully created.' }
          format.json { render :show, status: :created, location: @match }
        else
          format.html { render :new }
          format.json { render json: @match.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }

        format.json { render json: @match.errors, status: :unprocessable_entity }

      end

    end
  end
  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    params.permit(:message)
    respond_to do |format|
      if @match.update_attributes(match_params)
        send_called_notification(@match, params[:message])
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
        params.require(:match).permit(:matchday, :home_goals, :away_goals, :delegate1, :delegate2, :referee1, :referee2, :referee3, :home_observations, :away_observations, :ref_observations, :match_date, :away_team_id, :home_team_id, :competition_id, statistics_attributes:[:player_id, :match_id, :first_yellow, :second_yellow, :red, :goals, :penalties, :assists, :played_minutes, :own_goals, :state, :id], photos_attributes: [:id, :title, :description, :match_id, :photo, :approved, :private, :_destroy], home_team_attributes: [:id, :team_id, :_destroy, :permission, :icon, :photo, :season_id, :coach_ids, team_attributes: [:name, :n10, :level, :description, :id]], away_team_attributes: [:id, :team_id, :_destroy, :permission, :icon, :photo, :season_id, :coach_ids, team_attributes: [:name, :n10, :level, :description, :id]])
    end
end
