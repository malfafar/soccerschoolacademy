class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.datetime :practice_date
      t.text :observations
      t.integer :team_season_id

      t.timestamps null: false
    end
  end
end
