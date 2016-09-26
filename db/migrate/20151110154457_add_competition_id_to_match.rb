class AddCompetitionIdToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :competition_id, :integer
  end
end
