class CreatePlayerSeasons < ActiveRecord::Migration
  def change
    create_table :player_seasons do |t|
      t.integer :shirt_number
      t.float :shoe_size
      t.string :shirt_name

      t.references :team_season
      t.references :player

      t.timestamps null: false
    end

    add_index :player_seasons, ["team_season_id", "player_id"]
  end
end
