class AddLevelToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :level, :integer, null: false, default: 0
  end
end
