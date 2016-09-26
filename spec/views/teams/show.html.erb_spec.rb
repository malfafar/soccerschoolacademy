require 'rails_helper'

RSpec.describe "teams/show", type: :view do

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

  it "renders attributes in <p>" do
    render
  end
end
