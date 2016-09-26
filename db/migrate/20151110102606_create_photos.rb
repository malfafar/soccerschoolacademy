class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :description
      t.string :title
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
