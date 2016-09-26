require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should belong_to(:player_auth) }
  it { should belong_to(:guardian) }
  it { should have_many(:statistics) }
  it { should have_many(:player_seasons) }
  it { should have_many(:exams) }
  it { should have_many(:player_practices) }
  it { should accept_nested_attributes_for :player_auth }
  it { should accept_nested_attributes_for :guardian }

end

RSpec.describe PlayerAuth, type: :model do
  it { should have_one(:player) }
  it { should accept_nested_attributes_for :player }
end

RSpec.describe Guardian, type: :model do
  it { should belong_to(:guardian_auth) }
  it { should have_many(:players) }
  it { should accept_nested_attributes_for :guardian_auth }
end


RSpec.describe GuardianAuth, type: :model do
  it { should have_one(:guardian) }
  it { should accept_nested_attributes_for :guardian }
end

RSpec.describe TeamSeason, type: :model do
  it { should have_and_belong_to_many(:posts) }
  it { should belong_to(:team) }
  it { should belong_to(:season) }
  it { should have_and_belong_to_many(:competitions) }
  it { should have_and_belong_to_many(:coaches) }
  it { should have_many(:home_matches) }
  it { should have_many(:away_matches) }
  it { should have_many(:photos) }
  it { should have_many(:practices) }
  it { should have_many(:player_seasons) }
end
