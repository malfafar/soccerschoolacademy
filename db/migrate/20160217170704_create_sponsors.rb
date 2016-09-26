class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.boolean :homepage
      t.integer :competition_id
      t.integer :team_season_id
      t.string :name
      t.text :description
      t.text :url

      t.timestamps null: false
    end
  end
end
