class AddGuardianIdToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :guardian_id, :integer
  end
end
