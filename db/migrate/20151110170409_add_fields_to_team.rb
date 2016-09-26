class AddFieldsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :level, :integer, null: false, default: 0
    add_column :teams, :n10, :boolean, null: false, default: true
  end
end
