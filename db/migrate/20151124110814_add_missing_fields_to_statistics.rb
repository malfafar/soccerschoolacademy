class AddMissingFieldsToStatistics < ActiveRecord::Migration
  def change
    add_column :statistics, :played_minutes, :integer, null: false, default: 0
    add_column :statistics, :penalties, :integer, null: false, default: 0
    add_column :statistics, :assists, :integer, null: false, default: 0
  end
end
