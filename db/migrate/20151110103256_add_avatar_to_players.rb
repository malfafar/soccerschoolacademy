class AddAvatarToPlayers < ActiveRecord::Migration
  def up
    add_attachment :players, :avatar
  end

  def down
    remove_attachment :players, :avatar
  end
end
