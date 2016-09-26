require 'rails_helper'

RSpec.describe "sponsors/new", type: :view do
  before(:each) do
    assign(:sponsor, Sponsor.new(
      :homepage => false,
      :competition_id => 1,
      :team_season_id => 1,
      :name => "MyString",
      :description => "MyText",
      :url => "MyText"
    ))
  end

  it "renders new sponsor form" do
    render

    assert_select "form[action=?][method=?]", sponsors_path, "post" do

      assert_select "input#sponsor_homepage[name=?]", "sponsor[homepage]"

      assert_select "input#sponsor_competition_id[name=?]", "sponsor[competition_id]"

      assert_select "input#sponsor_team_season_id[name=?]", "sponsor[team_season_id]"

      assert_select "input#sponsor_name[name=?]", "sponsor[name]"

      assert_select "textarea#sponsor_description[name=?]", "sponsor[description]"

      assert_select "textarea#sponsor_url[name=?]", "sponsor[url]"
    end
  end
end
