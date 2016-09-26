class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.integer :nr_teams
      t.boolean :knockout
      t.string :name

      t.timestamps null: false
    end
  end
end
