class AddFieldsToPhoto < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.boolean :main
      t.boolean :private
    end
  end
end
