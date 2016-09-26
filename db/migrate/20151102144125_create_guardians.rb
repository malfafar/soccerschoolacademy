class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.string :name
      t.string :phone

      t.timestamps null: false
    end
  end
end
