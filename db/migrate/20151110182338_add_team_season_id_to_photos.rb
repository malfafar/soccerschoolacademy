class AddTeamSeasonIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :team_season_id, :integer
  end
end
