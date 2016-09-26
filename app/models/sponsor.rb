class Sponsor < ActiveRecord::Base
  has_and_belongs_to_many :competitions
  has_and_belongs_to_many :team_seasons


  has_attached_file :avatar, styles: { full: "1200x660#", gallery: "500x350#", medium: "300x300#", thumb: "100x100#" },
    default_url: "/images/:style/missing.jpg",
    :convert_options => {
      :large => "-quality 80 -interlace Plane",
      :thumb => "-quality 80 -interlace Plane"
    },
    processors: [:thumbnail, :compression]

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  def got_to_url
    if (self.url.include? "http:") ||  (self.url.include? "https:")
      sponsor_url = self.url
    else
      sponsor_url = "https://"+self.url
    end

    return sponsor_url
  end
end
