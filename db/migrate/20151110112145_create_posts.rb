class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.boolean :private

      t.timestamps null: false
    end
  end
end
