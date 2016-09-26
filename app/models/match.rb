class Match < ActiveRecord::Base
  has_many :statistics
  has_many :players, through: :statistics

  belongs_to :away_team, class_name: "TeamSeason"
  belongs_to :home_team, class_name: "TeamSeason"

  belongs_to :competition

  has_many :photos

  accepts_nested_attributes_for :home_team
  accepts_nested_attributes_for :away_team

  accepts_nested_attributes_for :photos, allow_destroy: true

  accepts_nested_attributes_for :statistics


  validates_presence_of :home_goals
  validates_presence_of :away_goals
  validates_presence_of :away_team_id
  validates_presence_of :home_team_id

  def self.search(search, season)
    w = joins(:home_team, :away_team).where("team_seasons.season_id = :season", season: season.id).where('matchday = :md', md: search.to_i)

    i1 = joins(home_team:  :team).where('season_id = :season and name ILIKE :search', season: season.id,search: "%#{search}%")

    i2 = joins(away_team:  :team).where('season_id = :season and name ILIKE :search', season: season.id,search: "%#{search}%")

    value = w + i1 + i2

    return value.uniq
  end

  def has_happened?
    if self.match_date < Time.now
      if self.home_goals != -1 && self.away_goals != -1
        true
      else
        false
      end
    else
      false
    end
  end
end
