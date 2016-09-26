class PracticesController < ApplicationController
  before_action :authenticate_coach!
  before_action :set_practice, only: [:show, :edit, :update, :destroy]
  before_action :set_player_practice, only: [:update_player_practice, :add_late_time]

  layout 'admin'
  # GET /practices
  # GET /practices.json
  def index

    params.permit(:search)

    if session.has_key?(:current_season)
      @current_season = Season.find(session[:current_season])
    else
      @current_season = Season.last
    end


    if params[:search]
      @practices = Kaminari.paginate_array(Practice.search(params[:search], @current_season)).page(params[:page]).per(30)
    else
      @practices = []
      @current_season.team_seasons.includes(:practices, :team).each do |team_season|
        team_season.practices.each do |practice|
          @practices << practice
        end
      end
      @practices = @practices.uniq
      @practices = @practices.sort_by { |k| k[:practice_date] }.reverse!
      @practices = Kaminari.paginate_array(@practices).page(params[:page]).per(30)
    end
  end

  # GET /practices/1
  # GET /practices/1.json
  def show
  end

  # GET /practices/new
  def new
    @practice = Practice.new
  end

  # GET /practices/1/edit
  def edit

  end

  # POST /practices
  # POST /practices.json
  def create
    @practice = Practice.new(practice_params)


    respond_to do |format|
      if @practice.save

        @practice.team_season.players.each do |pp|
          player_practice = PlayerPractice.new
          player_practice.player = pp
          player_practice.practice = @practice
          player_practice.save
        end

        format.html { redirect_to @practice, notice: 'Practice was successfully created.' }
        format.json { render :show, status: :created, location: @practice }
      else
        format.html { render :new }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /practices/1
  # PATCH/PUT /practices/1.json
  def update
    respond_to do |format|
      if @practice.update(practice_params)
        format.html { redirect_to @practice, notice: 'Practice was successfully updated.' }
        format.json { render :show, status: :ok, location: @practice }
      else
        format.html { render :edit }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_player_practice
    @player_practice.update_attributes(state: params[:state])
  end

  # DELETE /practices/1
  # DELETE /practices/1.json
  def destroy
    @practice.destroy
    respond_to do |format|
      format.html { redirect_to practices_url, notice: 'Practice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_late_time
    @player_practice.late_minutes = params[:minutes]
    @player_practice.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice
      @practice = Practice.find(params[:id])
    end

    def set_player_practice
      @player_practice = PlayerPractice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def practice_params
      params.require(:practice).permit(:practice_date, :observations, :team_season_id)
    end

    def player_practice_params

      params.require(:player_practice).permit(:state)
    end
end
