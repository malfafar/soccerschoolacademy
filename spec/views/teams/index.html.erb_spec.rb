require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    assign(:teams, [
      Team.create!(),
      Team.create!()
    ])
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  xit "renders a list of teams" do
    render
  end
end
