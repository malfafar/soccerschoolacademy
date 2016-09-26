class PlayerSeason < ActiveRecord::Base
  belongs_to :player
  belongs_to :team_season

  validates_presence_of :player_id
  # validates_presence_of :team_season_id
end
