class AddPlayerAuthIdToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :player_auth_id, :integer
  end
end
