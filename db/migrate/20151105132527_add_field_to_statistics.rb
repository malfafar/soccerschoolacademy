class AddFieldToStatistics < ActiveRecord::Migration
  def change
    add_column :statistics, :home, :boolean, null: false, default: true
  end
end
