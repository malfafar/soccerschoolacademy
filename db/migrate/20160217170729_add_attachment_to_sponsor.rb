class AddAttachmentToSponsor < ActiveRecord::Migration
  def up
    add_attachment :sponsors, :avatar
  end

  def down
    remove_attachment :sponsors, :avatar
  end
end
