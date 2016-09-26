class AddDefaultStateToPlayerPractice < ActiveRecord::Migration
  def up
    change_column :player_practices, :state, :integer, default: 0, null:false
  end
  def down
    change_column :player_practices, :state, :integer
  end
end
