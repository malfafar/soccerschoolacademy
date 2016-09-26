class Photo < ActiveRecord::Base
  belongs_to :team_season
  belongs_to :match
  has_attached_file :photo, styles: { full: "1200x660#", gallery: "500x350#", medium: "300x300#", thumb: "100x100#" },
    default_url: "/images/:style/missing.jpg",
    :convert_options => {
      :large => "-quality 80 -interlace Plane",
      :thumb => "-quality 80 -interlace Plane"
    },
    processors: [:thumbnail, :compression]

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  validates_format_of :video_url, with: /(https?:\/\/)?(www\.)?(yotu\.be\/|youtube\.com\/)?((.+\/)?(watch(\?|.+&))?(v[=|\/][\w_-]{11}))(&.+)?/,  :allow_blank => true

  def self.search(search)
    where('title ILIKE :search or description ILIKE :search', search: "%#{search}%")
  end
end
