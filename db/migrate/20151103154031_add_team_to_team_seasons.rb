class AddTeamToTeamSeasons < ActiveRecord::Migration
  def change
    add_reference :team_seasons, :team, index: true, foreign_key: true
  end
end
