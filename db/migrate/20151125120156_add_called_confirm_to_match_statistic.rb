class AddCalledConfirmToMatchStatistic < ActiveRecord::Migration
  def change
    add_column :statistics, :called_confirmation, :datetime
  end
end
