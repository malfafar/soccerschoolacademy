class AddSchoolIdToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :school_id, :integer
  end
end
