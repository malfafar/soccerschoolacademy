class EditStatisticsDefaults < ActiveRecord::Migration
  def change
    change_column :statistics, :yellows, :integer, default: 0, null: false
    change_column :statistics, :red, :boolean, default: false, null: false
    change_column :statistics, :goals, :integer, default: 0, null: false
    change_column :statistics, :own_goals, :integer, default: 0, null: false
    change_column :statistics, :state, :integer, default: 0, null: false
    change_column :statistics, :called, :boolean, default: true, null: false
  end
end
