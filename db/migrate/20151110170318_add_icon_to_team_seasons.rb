class AddIconToTeamSeasons < ActiveRecord::Migration
  def up
    add_attachment :team_seasons, :icon
  end

  def down
    remove_attachment :team_seasons, :icon
  end
end
