class AddFieldsToCoach < ActiveRecord::Migration
  def change
    add_column :coaches, :name, :string, null: false, default: ""
    add_column :coaches, :phone, :string, null: false, default: ""
  end
end
