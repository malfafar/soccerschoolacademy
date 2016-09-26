class TeamSeason < ActiveRecord::Base
  belongs_to :team

  belongs_to :season

  has_many :player_seasons
  has_many :players, :through => :player_seasons

  has_and_belongs_to_many :competitions

  has_many :away_matches, class_name: "Match", foreign_key: "away_team_id"
  has_many :home_matches, class_name: "Match", foreign_key: "home_team_id"
  has_and_belongs_to_many :coaches

  has_many :practices

  has_many :photos
  #has_and_belongs_to_many :photos

  has_and_belongs_to_many :posts

  has_and_belongs_to_many :sponsors
  accepts_nested_attributes_for :coaches, allow_destroy: true

  accepts_nested_attributes_for :player_seasons, allow_destroy: true

  accepts_nested_attributes_for :team

  accepts_nested_attributes_for :photos, allow_destroy: true
  # accepts_nested_attributes_for :player_seasons, allow_destroy: true

  validates_presence_of :team_id
  validates_presence_of :season_id

  has_attached_file :icon, styles: { medium: "300x300#", thumb: "100x100#", minithumb: "40x40#" },
    default_url: "/images/:style/missing.jpg",
    :convert_options => {
      :large => "-quality 80 -interlace Plane",
      :thumb => "-quality 80 -interlace Plane"
    },
    processors: [:thumbnail, :compression]
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/


  has_attached_file :photo, styles: { banner: "1337x300#", medium: "300x300#"},
    default_url: "/images/:style/missing.jpg",
    :convert_options => {
      :large => "-quality 80 -interlace Plane",
      :thumb => "-quality 80 -interlace Plane"
    },
    processors: [:thumbnail, :compression]

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def self.search(search, season)
    joins(:team).where('season_id = :season and teams.name ILIKE :search', search: "%#{search}%", season: season.id )
  end

  def statistics(competition, start_date, end_date)
    if competition
      stats = initialize_stats()

      if start_date == nil && end_date == nil
        home_matches = self.home_matches.where(competition_id: competition.id)
        away_matches = self.away_matches.where(competition_id: competition.id)
      else
        home_matches = self.home_matches.where(match_date: start_date..end_date, competition_id: competition.id)
        away_matches = self.away_matches.where(match_date: start_date..end_date, competition_id: competition.id)
      end


      stats = calculate_stats(stats, home_matches, away_matches)


      return stats
    else
      stats = initialize_stats()

      if start_date == nil && end_date == nil
        home_matches = self.home_matches
        away_matches = self.away_matches
      else
        home_matches = self.home_matches.where(match_date: start_date..end_date)
        away_matches = self.away_matches.where(match_date: start_date..end_date)
      end


      stats = calculate_stats()



      return stats
    end
  end

  private
    def initialize_stats
      stats = Hash.new
      stats[:points] = 0
      stats[:losses] = 0
      stats[:wins] = 0
      stats[:draws] = 0
      stats[:goal_diff] = 0
      stats[:goals_for] = 0
      stats[:goals_against] = 0
      stats[:played] = 0

      return stats
    end

    def calculate_stats(stats, home_matches, away_matches)
      home_matches.each do |h_match|
        if h_match.home_goals == h_match.away_goals
          stats[:points] += 1
          stats[:draws] += 1
        elsif h_match.home_goals > h_match.away_goals
          stats[:points] += 3
          stats[:wins] += 1
        else
          stats[:losses] += 1
        end
        stats[:goals_for] += h_match.home_goals >= 0  ? h_match.home_goals : 0
        stats[:goals_against] += h_match.away_goals >= 0  ? h_match.away_goals : 0
      end

      away_matches.each do |a_match|
        if a_match.away_goals == a_match.home_goals
          stats[:points] += 1
          stats[:draws] += 1
        elsif a_match.away_goals > a_match.home_goals
          stats[:points] += 3
          stats[:wins] += 1
        else
          stats[:losses] += 1
        end
        stats[:goals_for] +=  a_match.away_goals >= 0  ? a_match.away_goals : 0
        stats[:goals_against] += a_match.away_goals >= 0  ? a_match.away_goals : 0
      end


      stats[:goal_diff] = stats[:goals_for] - stats[:goals_against]
      stats[:played] = home_matches.size + away_matches.size
      return stats
    end


end
