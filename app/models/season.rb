class Season < ActiveRecord::Base
  has_many :team_seasons
  has_many :competitions

  validates_presence_of :start_year
  validates_presence_of :end_year

  def self.search(search)
    where('start_year = :search or end_year = :search', search: search.to_i)
  end
end
