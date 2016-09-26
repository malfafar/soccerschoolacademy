class CreatePhotosTeamSeasons < ActiveRecord::Migration
  def change
    create_table :photos_team_seasons, id: false do |t|
      t.integer :photo_id
      t.integer :team_season_id
    end
    add_index :photos_team_seasons, [:photo_id, :team_season_id]
  end
end
