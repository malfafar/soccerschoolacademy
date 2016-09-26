class AddLevelToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :level, :integer, null: false, default: 0
  end
end
