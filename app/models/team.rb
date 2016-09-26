class Team < ActiveRecord::Base
  has_many :team_seasons

  validates_presence_of :name
  validates_presence_of :level

  def self.search(search)
    where('name ILIKE :search', search: "%#{search}%")
  end
end
