class CreateTeamSeasons < ActiveRecord::Migration
  def change
    create_table :team_seasons do |t|

      t.timestamps null: false
    end
  end
end
