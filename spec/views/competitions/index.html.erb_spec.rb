require 'rails_helper'

RSpec.describe "competitions/index", type: :view do


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
    assign(:competitions, [
      Competition.create!(valid_attributes),
      Competition.create!(valid_attributes)
    ])
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  xit "renders a list of competitions" do
    render
  end
end
