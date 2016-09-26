class AddGuardianAuthIdToGuardian < ActiveRecord::Migration
  def change
    add_column :guardians, :guardian_auth_id, :integer
  end
end
