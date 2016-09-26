class Practice < ActiveRecord::Base
  has_many :player_practices
  has_many :players, through: :player_practices

  belongs_to :team_season

  validates_presence_of :practice_date
  validates_presence_of :team_season_id
  def self.search(search, season)
    w = joins(:team_season).where("team_seasons.season_id = :season", season: season.id).where('observations ILIKE :search', search: "%#{search}%")
    i1 = joins(team_season:  :team).where('season_id = :season and name ILIKE :search', season: season.id, search: "%#{search}%")
    value = w + i1
    return value.uniq
  end
end
