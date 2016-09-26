class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :matchday
      t.integer :home_goals
      t.integer :away_goals
      t.string :delegate1
      t.string :delegate2
      t.string :referee1
      t.string :referee2
      t.string :referee3
      t.text :home_observations
      t.text :away_observations
      t.text :ref_observations
      t.datetime :match_date

      t.timestamps null: false
    end
  end
end
