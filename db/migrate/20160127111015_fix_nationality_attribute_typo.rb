class FixNationalityAttributeTypo < ActiveRecord::Migration
  def self.up
    rename_column :players, :nacionality, :nationality
  end

  def self.down
    rename_column :players, :nationality, :nacionality
  end
end
