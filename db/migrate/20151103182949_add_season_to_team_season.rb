class AddSeasonToTeamSeason < ActiveRecord::Migration
  def change
    add_reference :team_seasons, :season, index: true, foreign_key: true
  end
end
