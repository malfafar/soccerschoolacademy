require 'rails_helper'

RSpec.describe "sponsors/show", type: :view do
  before(:each) do
    @sponsor = assign(:sponsor, Sponsor.create!(
      :homepage => false,
      :competition_id => 1,
      :team_season_id => 2,
      :name => "Name",
      :description => "MyText",
      :url => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
