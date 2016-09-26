class AddLateMinutesToPracticesAndMatches < ActiveRecord::Migration
  def change
    add_column :player_practices, :late_minutes, :integer, null: false, default: 0
    add_column :statistics, :late_minutes, :integer, null: false, default: 0
  end
end
