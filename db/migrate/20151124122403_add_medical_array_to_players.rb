class AddMedicalArrayToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :medicals, :date, array: true, default: []
  end
end
