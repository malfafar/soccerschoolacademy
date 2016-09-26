class ChangeMatchGoalsDefaultValue < ActiveRecord::Migration
  def up
    change_column_default(:matches, :home_goals, -1)
    change_column_default(:matches, :away_goals, -1)
  end

  def down
    change_column_default(:matches, :home_goals, 0)
    change_column_default(:matches, :away_goals, 0)
  end
end
