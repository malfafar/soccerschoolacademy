class CreatePlayerPractices < ActiveRecord::Migration
  def change
    create_table :player_practices do |t|
      t.integer :state
      t.integer :practice_id
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
