class Coach < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :team_seasons
  has_many :posts

  validates_presence_of :name
  validates_format_of :phone, with: /((\+|(00)))?\b\d{8,15}\b/, allow_blank: true, message: "The phone should have between 8 and 15 characters. Country code is optional."
  # validates_format_of :phone, with: /(((\+|00)\d{3}-?)?\d{9})/

  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

end
