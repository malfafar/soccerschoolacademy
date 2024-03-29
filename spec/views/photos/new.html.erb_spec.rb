require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new())
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do
    end
  end
end
