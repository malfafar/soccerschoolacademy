class Competition < ActiveRecord::Base
  belongs_to :season

  has_and_belongs_to_many :team_seasons

  has_many :matches
  # accepts_nested_attributes_for :team_seasons, allow_destroy: true
  accepts_nested_attributes_for :team_seasons


  has_and_belongs_to_many :sponsors
  
  validates_presence_of :nr_teams
  validates_presence_of :name
  validates_presence_of :season_id

  def self.search(search, season)
    where('season_id = :season and name ILIKE :search', search: "%#{search}%", season: season.id)
  end
end
