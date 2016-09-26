RSpec.shared_context "api request global before and after hooks" do

  before(:each) do
    Warden.test_mode!
  end

  after(:each) do
    Warden.test_reset!
  end
end

RSpec.shared_context "api request authentication helper methods" do
  def login_player_auth(player_auth)
    login_as(player_auth, scope: :player_auth)
  end

  def logout_player_auth
    logout(:player_auth)
  end

  def login_coach(coach)
    login_as(coach, scope: :coach)
  end

  def logout_coach
    logout(:coach)
  end

  def login_guardian_auth(guardian_auth)
    login_as(guardian_auth, scope: :guardian_auth)
  end

  def logout_guardian_auth
    logout(:guardian_auth)
  end
end
