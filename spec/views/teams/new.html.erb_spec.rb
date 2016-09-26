require 'rails_helper'

RSpec.describe "teams/new", type: :view do
  before(:each) do
    assign(:team, Team.new())
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  it "renders new team form" do
    render

    assert_select "form[action=?][method=?]", teams_path, "post" do
    end
  end
end
