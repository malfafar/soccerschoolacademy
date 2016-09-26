class ChangeLevelDefault < ActiveRecord::Migration
  def change
    change_column :photos, :level, :integer, null: false, default: -1
    change_column :posts, :level, :integer, null: false, default: -1
  end
end
