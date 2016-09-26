class AddCoachIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :coach_id, :integer
  end
end
