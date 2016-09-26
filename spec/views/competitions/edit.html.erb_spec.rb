require 'rails_helper'

RSpec.describe "competitions/edit", type: :view do

  let!(:season) do
    Season.create(start_year: "2015", end_year: "2016")
  end

  let(:valid_attributes) {
    {
      name: Faker::Name.name,
      nr_teams: Faker::Number.number(2),
      knockout: true,
      season_id: season.id
    }
  }

  before(:each) do

    @competition = assign(:competition, Competition.create!(valid_attributes))
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  it "renders the edit competition form" do
    render

    assert_select "form[action=?][method=?]", competition_path(@competition), "post" do
    end
  end
end
