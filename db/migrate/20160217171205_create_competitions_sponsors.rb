class CreateCompetitionsSponsors < ActiveRecord::Migration
  def change
    create_table :competitions_sponsors do |t|
      t.integer "sponsor_id"
      t.integer "competition_id"
    end
    add_index :competitions_sponsors, ["sponsor_id", "competition_id"], name: 'competitions_sponsors_index'
  end
end
