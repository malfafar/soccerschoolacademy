class GeneralPagesController < ApplicationController
  before_action :set_team_season, only: [:player, :players, :calendar, :rankings, :competitions, :competition, :match]
  before_action :set_competition, only: [:rankings, :calendar, :competition]
  before_action :set_match, only: [:match]
  before_action :set_player, only: [:player]
  include StatisticsHelper


#  █████  ██████   ██████  ██    ██ ████████
# ██   ██ ██   ██ ██    ██ ██    ██    ██
# ███████ ██████  ██    ██ ██    ██    ██
# ██   ██ ██   ██ ██    ██ ██    ██    ██
# ██   ██ ██████   ██████   ██████     ██

  def about
  end

#  ██████  █████  ██      ███████ ███    ██ ██████   █████  ██████
# ██      ██   ██ ██      ██      ████   ██ ██   ██ ██   ██ ██   ██
# ██      ███████ ██      █████   ██ ██  ██ ██   ██ ███████ ██████
# ██      ██   ██ ██      ██      ██  ██ ██ ██   ██ ██   ██ ██   ██
#  ██████ ██   ██ ███████ ███████ ██   ████ ██████  ██   ██ ██   ██

  def calendar
    if @competition
      @matches = @competition.matches.includes(:away_team, :home_team)#@team_season.home_matches.where(competition_id: @competition.id) + @team_season.away_matches.where(competition_id: @competition.id)
      @matches.sort_by { |k| k.match_date }.reverse!
    else
      @matches = @team_season.home_matches.includes(:away_team, :home_team) + @team_season.away_matches.includes(:away_team, :home_team)
      @matches.sort_by { |k| k.match_date }.reverse!
    end
  end

#  ██████ ██   ██  █████  ███    ██  ██████  ███████         ███████ ███████  █████  ███████  ██████  ███    ██
# ██      ██   ██ ██   ██ ████   ██ ██       ██              ██      ██      ██   ██ ██      ██    ██ ████   ██
# ██      ███████ ███████ ██ ██  ██ ██   ███ █████           ███████ █████   ███████ ███████ ██    ██ ██ ██  ██
# ██      ██   ██ ██   ██ ██  ██ ██ ██    ██ ██                   ██ ██      ██   ██      ██ ██    ██ ██  ██ ██
#  ██████ ██   ██ ██   ██ ██   ████  ██████  ███████ ███████ ███████ ███████ ██   ██ ███████  ██████  ██   ████

  def change_season

    @current_season = Season.find(params[:current_season])
    session[:current_season] = params[:current_season]

    respond_to do |format|
      if params.has_key? (:current_team_season)
        puts "TEM"
        current_team_season =  TeamSeason.find(params[:current_team_season])
      end

      if current_team_season
        @team_season = current_team_season.team.team_seasons.where(season_id: @current_season.id).first

        if !@team_season
          format.html {redirect_to all_teams_path}
        else
          format.html {redirect_to team_players_path(@team_season.id)}
        end
      end

      format.html { redirect_to  :back }
    end
  end

#  ██████  ██████  ███    ███ ██████  ███████ ████████ ██ ████████ ██  ██████  ███    ██
# ██      ██    ██ ████  ████ ██   ██ ██         ██    ██    ██    ██ ██    ██ ████   ██
# ██      ██    ██ ██ ████ ██ ██████  █████      ██    ██    ██    ██ ██    ██ ██ ██  ██
# ██      ██    ██ ██  ██  ██ ██      ██         ██    ██    ██    ██ ██    ██ ██  ██ ██
#  ██████  ██████  ██      ██ ██      ███████    ██    ██    ██    ██  ██████  ██   ████

  def competition

  end


#  ██████  ██████  ███    ███ ██████  ███████ ████████ ██ ████████ ██  ██████  ███    ██ ███████
# ██      ██    ██ ████  ████ ██   ██ ██         ██    ██    ██    ██ ██    ██ ████   ██ ██
# ██      ██    ██ ██ ████ ██ ██████  █████      ██    ██    ██    ██ ██    ██ ██ ██  ██ ███████
# ██      ██    ██ ██  ██  ██ ██      ██         ██    ██    ██    ██ ██    ██ ██  ██ ██      ██
#  ██████  ██████  ██      ██ ██      ███████    ██    ██    ██    ██  ██████  ██   ████ ███████

  def competitions
    if session.has_key?(:current_season)
      @competitions = Season.find(session[:current_season].to_i).competitions
    else
      @competitions = Season.last.competitions
    end
  end


#  ██████  ██████  ███    ██ ████████  █████   ██████ ████████
# ██      ██    ██ ████   ██    ██    ██   ██ ██         ██
# ██      ██    ██ ██ ██  ██    ██    ███████ ██         ██
# ██      ██    ██ ██  ██ ██    ██    ██   ██ ██         ██
#  ██████  ██████  ██   ████    ██    ██   ██  ██████    ██

  def contact

  end
  def send_contact
    respond_to do |format|
      if ContactMailer.contact_email(params[:contact_info]).deliver_later
        format.html { redirect_to contact_path, notice: 'O Email foi enviado com sucesso' }
        #format.json { render :confirm_work, status: :created, location: confirm_client_works_path(@work) }
      else
        format.html { redirect_to contact_path, alert: "Ocorreu um erro, por favor tente de novo." }
        #format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end


# ██ ███    ██ ██████  ███████ ██   ██
# ██ ████   ██ ██   ██ ██       ██ ██
# ██ ██ ██  ██ ██   ██ █████     ███
# ██ ██  ██ ██ ██   ██ ██       ██ ██
# ██ ██   ████ ██████  ███████ ██   ██

  def index
    @posts = Post.includes(:coach).where(private: false).order(created_at: :desc).limit(4)
    @sponsors = Sponsor.where(homepage: true)
    @slides = Slide.all
  end


# ███    ███  █████  ████████  ██████ ██   ██
# ████  ████ ██   ██    ██    ██      ██   ██
# ██ ████ ██ ███████    ██    ██      ███████
# ██  ██  ██ ██   ██    ██    ██      ██   ██
# ██      ██ ██   ██    ██     ██████ ██   ██

  def match

  end


# ██████  ██   ██  ██████  ████████  ██████           ██████   █████  ██      ██      ███████ ██████  ██    ██
# ██   ██ ██   ██ ██    ██    ██    ██    ██         ██       ██   ██ ██      ██      ██      ██   ██  ██  ██
# ██████  ███████ ██    ██    ██    ██    ██         ██   ███ ███████ ██      ██      █████   ██████    ████
# ██      ██   ██ ██    ██    ██    ██    ██         ██    ██ ██   ██ ██      ██      ██      ██   ██    ██
# ██      ██   ██  ██████     ██     ██████  ███████  ██████  ██   ██ ███████ ███████ ███████ ██   ██    ██

  def photo_gallery
    if params.has_key?(:level)
      @team_season = TeamSeason.find(params[:id])
      @photos = Photo.where(level: params[:level], approved: true).page(params[:page]).per(30)
    elsif params.has_key?(:id)
      @team_season = TeamSeason.find(params[:id])
      @photos = @team_season.photos.where(approved: true).page(params[:page]).per(30)
    else
      @photos = Photo.where(private: false, approved: true).page(params[:page]).per(30)
    end
  end

# ██████  ██       █████  ██    ██ ███████ ██████
# ██   ██ ██      ██   ██  ██  ██  ██      ██   ██
# ██████  ██      ███████   ████   █████   ██████
# ██      ██      ██   ██    ██    ██      ██   ██
# ██      ███████ ██   ██    ██    ███████ ██   ██
  def player
    # if session.has_key?(:current_season)
    #   @p_team = @player.team_seasons.where(season: session[:current_season]).first
    # else
    #   @p_team = @player.team_seasons.where(season: Season.last).first
    # end

    @p_team = @team_season

    @p_stats = @player.match_statistics(nil, nil, nil)
  end

# ██████  ██       █████  ██    ██ ███████ ██████  ███████
# ██   ██ ██      ██   ██  ██  ██  ██      ██   ██ ██
# ██████  ██      ███████   ████   █████   ██████  ███████
# ██      ██      ██   ██    ██    ██      ██   ██      ██
# ██      ███████ ██   ██    ██    ███████ ██   ██ ███████

  def players
    @players = @team_season.players.order("random()")
    @sponsors = @team_season.sponsors
  end


# ██████   ██████  ███████ ████████ ███████
# ██   ██ ██    ██ ██         ██    ██
# ██████  ██    ██ ███████    ██    ███████
# ██      ██    ██      ██    ██         ██
# ██       ██████  ███████    ██    ███████

  def posts
    if params.has_key?(:level)
      @team_season = TeamSeason.find(params[:id])
      @posts = Post.includes(:coach).where(level: params[:level]).order(created_at: :desc).page(params[:page]).per(30)
    elsif params.has_key?(:id)
      @team_season = TeamSeason.find(params[:id])
      @posts = @team_season.posts.includes(:coach).order(created_at: :desc).page(params[:page]).per(30)
    else
      @posts = Post.includes(:coach).where(private: false).order(created_at: :desc).page(params[:page]).per(30)
    end
  end


# ██████   ██████  ███████ ████████
# ██   ██ ██    ██ ██         ██
# ██████  ██    ██ ███████    ██
# ██      ██    ██      ██    ██
# ██       ██████  ███████    ██

  def post
    if params.has_key?(:id)
      @team_season = TeamSeason.find(params[:id])
    end
    @post = Post.find(params[:post_id])
  end


# ██████   █████  ███    ██ ██   ██ ██ ███    ██  ██████  ███████
# ██   ██ ██   ██ ████   ██ ██  ██  ██ ████   ██ ██       ██
# ██████  ███████ ██ ██  ██ █████   ██ ██ ██  ██ ██   ███ ███████
# ██   ██ ██   ██ ██  ██ ██ ██  ██  ██ ██  ██ ██ ██    ██      ██
# ██   ██ ██   ██ ██   ████ ██   ██ ██ ██   ████  ██████  ███████

  def rankings
    ranking=[]
    if session.has_key?(:current_season)
      @current_season = Season.find(session[:current_season].to_i)
    else
      @current_season = Season.last
    end

    @current_season.team_seasons.includes(:team).each do |team_season|
      stat = team_season.statistics(@competition, nil, nil)
      stat[:name] = team_season.team.name
      stat[:team_id] = team_season.id
      ranking << stat
    end
    @sorted = ranking.sort_by { |k| k[:points] }.reverse!
    @sponsors = @competition.sponsors
  end


# ███████ ███████  █████  ███████  ██████  ███    ██ ███████
# ██      ██      ██   ██ ██      ██    ██ ████   ██ ██
# ███████ █████   ███████ ███████ ██    ██ ██ ██  ██ ███████
#      ██ ██      ██   ██      ██ ██    ██ ██  ██ ██      ██
# ███████ ███████ ██   ██ ███████  ██████  ██   ████ ███████

  def seasons
  end


# ████████ ███████  █████  ███    ███ ███████
#    ██    ██      ██   ██ ████  ████ ██
#    ██    █████   ███████ ██ ████ ██ ███████
#    ██    ██      ██   ██ ██  ██  ██      ██
#    ██    ███████ ██   ██ ██      ██ ███████

  def teams
    if session.has_key?(:current_season)
      @team_seasons = Season.find(session[:current_season].to_i).team_seasons.includes(:team)
    else
      @team_seasons = Season.last.team_seasons.includes(:team)
    end
  end

  private

  def set_team_season
    @team_season = TeamSeason.find(params[:id])
  end

  def set_match
    @match = Match.find(params[:m_id])
  end

  def set_competition
    if params.has_key?(:c_id)
      @competition = Competition.find(params[:c_id])
    end
  end

  def set_player
    if params.has_key?(:p_id)
      @player = Player.find(params[:p_id])
    end
  end
end
