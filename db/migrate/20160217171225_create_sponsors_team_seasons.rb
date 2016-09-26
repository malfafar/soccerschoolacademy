class CreateSponsorsTeamSeasons < ActiveRecord::Migration
  def change
    create_table :sponsors_team_seasons, :id => false do |t|
      t.integer "sponsor_id"
      t.integer "team_season_id"
    end
    add_index :sponsors_team_seasons, ["sponsor_id", "team_season_id"], name: 'sponsors_team_seasons_index'
  end
end
