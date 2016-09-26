require 'rails_helper'


RSpec.describe Player, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :birthday }

  it { should_not allow_value("aaaaaa").for(:phone) }
  it { should_not allow_value("351789789789111").for(:phone) }
  it { should allow_value("999999999").for(:phone) }
  it { should allow_value("+908123345678").for(:phone) }
  it { should allow_value("00908123345678").for(:phone) }

  it { should_not allow_value("3000").for(:zipcode) }
  it { should_not allow_value("3000266").for(:zipcode) }
  it { should allow_value("3000-266").for(:zipcode) }

  it { should_not allow_value("aaa").for(:vat_id) }
  it { should_not allow_value("39789789").for(:vat_id) }
  it { should_not allow_value("3978978999").for(:vat_id) }
  it { should allow_value("999999999").for(:vat_id) }
end

RSpec.describe Guardian, type: :model do
  it { should validate_presence_of :name }

  it { should validate_presence_of :phone }
  it { should_not allow_value("aaaaaa").for(:phone) }
  it { should_not allow_value("351789789789111").for(:phone) }
  it { should allow_value("999999999").for(:phone) }
  it { should allow_value("+908123345678").for(:phone) }
  it { should allow_value("00908123345678").for(:phone) }
end

RSpec.describe TeamSeason, type: :model do
  it { should validate_presence_of :team_id }
  it { should validate_presence_of :season_id }
end

RSpec.describe Match, type: :model do
  it { should validate_presence_of :home_goals}
  it { should validate_presence_of :away_goals }
  it { should validate_presence_of :away_team_id }
  it { should validate_presence_of :home_team_id }

end

RSpec.describe Post, type: :model do

  it { should validate_presence_of :title }
  it { should validate_presence_of :text }
end

RSpec.describe Photo, type: :model do

  it { should_not allow_value("https://vimeo.com/channels/staffpicks/148002589").for(:video_url) }
  it { should_not allow_value("http://www.youtube.com/").for(:video_url) }

  it { should allow_value("http://www.youtube.com/watch?v=ezvJukx-kLM").for(:video_url) }
  it { should allow_value("https://www.youtube.com/watch?v=ezvJukx-kLM").for(:video_url) }
  it { should allow_value("https://www.youtu.be/watch?v=ezvJukx-kLM").for(:video_url) }

end

RSpec.describe PlayerSeason, type: :model do

  it { should validate_presence_of :player_id }
  # it { should validate_presence_of :team_season_id }

end

RSpec.describe Season, type: :model do

  it { should validate_presence_of :start_year }
  it { should validate_presence_of :end_year }

end

RSpec.describe Practice, type: :model do

  it { should validate_presence_of :practice_date }
  it { should validate_presence_of :team_season_id }

end

RSpec.describe Statistic, type: :model do

  it { should validate_presence_of :goals }
  it { should validate_presence_of :player_id }
  it { should validate_presence_of :match_id }
  it { should validate_numericality_of(:goals).is_greater_than_or_equal_to 0 }

end

RSpec.describe PlayerPractice, type: :model do

  it { should validate_presence_of :player_id }
  it { should validate_presence_of :practice_id }

end

RSpec.describe Exam, type: :model do

  it { should validate_presence_of :height }
  it { should validate_presence_of :weight }
  it { should validate_presence_of :player_id }

end


RSpec.describe Team, type: :model do

  it { should validate_presence_of :name }
  it { should validate_presence_of :level }

end

RSpec.describe Competition, type: :model do

  it { should validate_presence_of :nr_teams }
  it { should validate_presence_of :name }
  it { should validate_presence_of :season_id }

end

RSpec.describe Coach, type: :model do
  it { should_not allow_value("aaaaaa").for(:phone) }
  it { should_not allow_value("3517897897891115").for(:phone) }
  it { should allow_value("999999999").for(:phone) }
  it { should allow_value("+908123345678").for(:phone) }
  it { should allow_value("00908123345678").for(:phone) }
  it { should validate_presence_of :name }
end
