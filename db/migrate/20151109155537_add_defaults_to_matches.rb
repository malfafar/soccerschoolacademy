class AddDefaultsToMatches < ActiveRecord::Migration
  def change
    change_column :matches, :matchday, :integer, null: false, default: 0
    change_column :matches, :home_goals, :integer, null: false, default: 0
    change_column :matches, :away_goals, :integer, null: false, default: 0
    change_column :matches, :delegate1, :string, null: false, default: ""
    change_column :matches, :delegate2, :string, null: false, default: ""
    change_column :matches, :referee1, :string, null: false, default: ""
    change_column :matches, :referee2, :string, null: false, default: ""
    change_column :matches, :referee3, :string, null: false, default: ""
    change_column :matches, :home_observations, :text, null: false, default: ""
    change_column :matches, :home_observations, :text, null: false, default: ""
    change_column :matches, :home_observations, :text, null: false, default: ""
  end
end
