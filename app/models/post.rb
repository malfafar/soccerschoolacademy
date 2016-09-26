class Post < ActiveRecord::Base
  has_and_belongs_to_many :team_seasons

  has_attached_file :photo, styles: { large: "1000x500#", medium: "300x300#", thumb: "100x100#", small: "175x150#" },
    default_url: "/images/:style/missing.jpg",
    :convert_options => {
      :large => "-quality 80 -interlace Plane",
      :thumb => "-quality 80 -interlace Plane"
    },
    processors: [:thumbnail, :compression]

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  validates_presence_of :title
  validates_presence_of :text
  
  belongs_to :coach
  def self.search(search)
    where('title ILIKE :search or text ILIKE :search', search: "%#{search}%")
  end
end
