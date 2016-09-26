class RemoveIdsFromSponsor < ActiveRecord::Migration
  def up
    remove_column :sponsors, :competition_id, :integer
    remove_column :sponsors, :team_season_id, :integer
  end

  def down
    add_column :sponsors, :competition_id, :integer
    add_column :sponsors, :team_season_id, :integer
  end
end
