class Exam < ActiveRecord::Base
  belongs_to :player

  validates_presence_of :height
  validates_presence_of :weight
  # validates_presence_of :player_id
end
