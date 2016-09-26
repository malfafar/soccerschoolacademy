class AddPhotoToPhoto < ActiveRecord::Migration
  def up
    add_attachment :photos, :photo
  end

  def down
    remove_attachment :photos, :photo
  end
end
