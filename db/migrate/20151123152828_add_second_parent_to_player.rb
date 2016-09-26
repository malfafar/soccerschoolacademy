class AddSecondParentToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :second_parent, :string, null: false, default: ""
  end
end
