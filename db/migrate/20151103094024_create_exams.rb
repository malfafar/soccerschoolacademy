class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.date :exam_date
      t.string :height
      t.string :weight

      t.timestamps null: false
    end
  end
end
