class CreateCoachCompetition < ActiveRecord::Migration
  def change
    create_table :coaches_team_seasons, :id =>false do |t|
      t.integer "coach_id"
      t.integer "team_season_id"
    end
    add_index :coaches_team_seasons, ["coach_id", "team_season_id"], name: 'coaches_team_seasons_index'
  end
end
