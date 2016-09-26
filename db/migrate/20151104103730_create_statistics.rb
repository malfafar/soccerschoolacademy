class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :yellows
      t.boolean :red
      t.integer :goals
      t.integer :own_goals
      t.integer :state
      t.boolean :called
      t.integer :player_id
      t.integer :match_id

      t.timestamps null: false
    end
  end
end
