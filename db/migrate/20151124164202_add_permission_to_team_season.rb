class AddPermissionToTeamSeason < ActiveRecord::Migration
  def change
    add_column :team_seasons, :permission, :integer, null: false, default: 0
  end
end
