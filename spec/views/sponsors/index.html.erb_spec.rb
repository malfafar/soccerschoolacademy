require 'rails_helper'

RSpec.describe "sponsors/index", type: :view do
  before(:each) do
    assign(:sponsors, [
      Sponsor.create!(
        :homepage => false,
        :competition_id => 1,
        :team_season_id => 2,
        :name => "Name",
        :description => "MyText",
        :url => "MyText"
      ),
      Sponsor.create!(
        :homepage => false,
        :competition_id => 1,
        :team_season_id => 2,
        :name => "Name",
        :description => "MyText",
        :url => "MyText"
      )
    ])
  end

  it "renders a list of sponsors" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
