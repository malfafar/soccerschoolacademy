class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :level
      
      t.timestamps null: false
    end
  end
end
