class AddAttachmentToTeamSeason < ActiveRecord::Migration
  def up
    add_attachment :team_seasons, :photo
  end

  def down
    remove_attachment :team_seasons, :photo
  end
end
