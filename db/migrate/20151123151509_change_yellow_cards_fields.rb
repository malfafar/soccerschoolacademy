class ChangeYellowCardsFields < ActiveRecord::Migration
  def change
    remove_column :statistics, :yellows, :integer, default: 0, null: false
    add_column :statistics, :first_yellow, :boolean, default: false, null: false
    add_column :statistics, :second_yellow, :boolean, default: false, null: false
  end
end
