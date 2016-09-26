class PlayerPractice < ActiveRecord::Base
  belongs_to :practice
  belongs_to :player

  validates_presence_of :player_id
  validates_presence_of :practice_id
end
