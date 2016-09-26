class Guardian < ActiveRecord::Base

  belongs_to :guardian_auth
  has_many :players


  accepts_nested_attributes_for :guardian_auth, allow_destroy: true

  validates :name, presence: true, allow_blank: false
  validates :phone, presence: true
  validates_format_of :phone, with: /((\+|(00)))?\b\d{8,14}\b/

  def self.search(search)
    w = where('name ILIKE :search', search: "%#{search}%")
    j = joins(:guardian_auth).where('guardian_auths.email ILIKE :search', search: "%#{search}%")
    value = w + j
    return value.uniq
  end
end
