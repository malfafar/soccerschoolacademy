class School < ActiveRecord::Base
  has_many :players

  validates_presence_of :name
  def self.search(search)
    where('name ILIKE :search', search: "%#{search}%")
  end
end
