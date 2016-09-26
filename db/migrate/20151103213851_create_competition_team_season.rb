class CreateCompetitionTeamSeason < ActiveRecord::Migration
  def change
    create_table :competitions_team_seasons, :id =>false do |t|
      t.integer "competition_id"
      t.integer "team_season_id"
    end
    add_index :competitions_team_seasons, ["competition_id", "team_season_id"], name: 'competitions_team_seasons_index'
  end
end
