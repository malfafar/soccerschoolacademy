class CreateCompetitionSeason < ActiveRecord::Migration
  def change
    add_reference :competitions, :season, index: true, foreign_key: true
  end
end
