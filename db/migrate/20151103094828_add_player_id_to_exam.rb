class AddPlayerIdToExam < ActiveRecord::Migration
  def change
    add_column :exams, :player_id, :integer
  end
end
