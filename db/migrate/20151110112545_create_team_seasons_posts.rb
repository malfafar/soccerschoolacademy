class CreateTeamSeasonsPosts < ActiveRecord::Migration
  def change
    create_table :posts_team_seasons do |t|
      t.integer :team_season_id
      t.integer :post_id
    end
    add_index :posts_team_seasons, [:post_id, :team_season_id]
  end
end
