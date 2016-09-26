class Player < ActiveRecord::Base

  belongs_to :player_auth
  belongs_to :guardian

  belongs_to :school

  has_many :exams
  has_many :player_seasons
  has_many :team_seasons, :through => :player_seasons

  has_many :statistics
  has_many :matches, through: :statistics

  has_many :player_practices
  has_many :practices, through: :player_practices

  accepts_nested_attributes_for :guardian
  accepts_nested_attributes_for :exams, allow_destroy: true
  accepts_nested_attributes_for :school
  accepts_nested_attributes_for :player_auth

  validates_presence_of :birthday

  validates :name, presence: true, allow_blank: false
  validates :phone, presence: true
  validates_format_of :phone, with: /((\+|(00)))?\b\d{8,14}\b/, allow_blank: true
  validates_format_of :zipcode, with: /\d{4}-\d{3}/, allow_blank: true
  validates_format_of :vat_id, with: /\d{9}/, allow_blank: true

  # \d{4}-\d{3} ZIPCODE

  has_attached_file :avatar, styles: { medium: "250x350#", thumb: "100x100#" }, default_url: "/images/:style/missing.jpg",
  :convert_options => {
    :medium => "-quality 80 -interlace Plane",
    :thumb => "-quality 80 -interlace Plane"
  },
  processors: [:thumbnail, :compression]


  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  include TeamSeasonsHelper
  def self.search(search)
    w = where('name ILIKE :search', search: "%#{search}%")
    j = joins(:player_auth).where('player_auths.email ILIKE :search', search: "%#{search}%")
    value = w + j
    value = value.sort_by{|e| e.name}
    return value.uniq
  end

  def age
    (Date.today - self.birthday).to_i / 365
  end

  def abrv_name
    abrv_name = name.split
    if abrv_name.length > 1
      "#{abrv_name.first} #{abrv_name.last}"
    else
      "#{abrv_name.first}"
    end
  end

  def match_statistics(competition, start_date, end_date)
    stats = initialize_stats(false)

    if competition
      if start_date == nil && end_date == nil
        matches = self.matches.where(competition_id: competition.id)
      else
        matches = self.matches.where(match_date: start_date..end_date, competition_id: competition.id)
      end
    else
      if start_date == nil && end_date == nil
        matches = self.matches
      else
        matches = self.matches.where(match_date: start_date..end_date)
      end
    end
    calculate_match_stats(stats, matches, false)

    return stats
  end

  def total_statistics(competition, start_date, end_date)
    stats = initialize_stats(true)
    if competition
      if start_date == nil && end_date == nil
        matches = self.matches.where(competition_id: competition.id)
        practices = self.practices.where(competition_id: competition.id)
      else
        matches = self.matches.where(match_date: start_date..end_date, competition_id: competition.id)
        practices = self.practices.where(practice_date: start_date..end_date, competition_id: competition.id)
      end
    else
      if start_date == nil && end_date == nil
        matches = self.matches
        practices = self.practices
      else
        matches = self.matches.where(match_date: start_date..end_date)
        practices = self.practices.where(practice_date: start_date..end_date)
      end
    end
    calculate_match_stats(stats, matches, true)
  end

  def single_match_statistics

  end
  private

  def initialize_stats(with_practices)
    stats = Hash.new

    if with_practices
      get_states_options().each do |state|
        stats[""+state[1].to_s] = 0
      end
    end

    stats[:goals] = 0
    stats[:yellows] = 0
    stats[:red] = 0
    stats[:own_goals] = 0
    stats[:played] = 0
    stats[:penalties] = 0
    stats[:assists] = 0
    stats[:played_minutes] = 0

    return stats
  end

  def calculate_match_stats(stats, matches, with_practices)

    matches.each do |match|
      stat = match.statistics.where(player_id: self.id).first

      if with_practices
        stats[""+stat.state.to_s] += 1
        if stat.state == 3
          stats[""+1.to_s] += 1
        end
      end

      stats[:goals] += stat.goals
      if stat.first_yellow
        stats[:yellows] += 1
      end
      if stat.second_yellow
        stats[:yellows] += 1
      end
      if stat.red
        stats[:red] += 1
      else
        stats[:red] += 0
      end
      stats[:own_goals] += stat.own_goals
      if stat.called
        stats[:played] += 1
      else
        stats[:played] += 0
      end
      stats[:penalties] += stat.penalties
      stats[:assists] += stat.assists
      stats[:played_minutes] += stat.played_minutes
    end


    return stats
  end

  def calculate_practice_stats(stats, practices)
    practices.each do |practice|
      stat = practice.player_practices.where(player_id: self.id).first

      stats[""+stat.state.to_s] += 1
      if stat.state == 3
        stats[""+1.to_s] += 1
      end

      stats[:pp_late_minutes] += stat.late_minutes
    end

    return stats
  end

end
