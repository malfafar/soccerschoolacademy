class Statistic < ActiveRecord::Base

  belongs_to :match
  belongs_to :player

  validates_presence_of :player_id
  validates_presence_of :match_id
  validates_presence_of :goals
  validates :goals, numericality: { greater_than_or_equal_to: 0 }
  # :greater_than
end
