class AddMatchIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :match_id, :integer
  end
end
