require 'rails_helper'

RSpec.describe "teams/edit", type: :view do

  let(:valid_attributes) {
    {
      name: Faker::Team.name,
      description: Faker::Team.sport
    }
  }

  before(:each) do
    @team = assign(:team, Team.create!(valid_attributes))
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(@team), "post" do
    end
  end
end
