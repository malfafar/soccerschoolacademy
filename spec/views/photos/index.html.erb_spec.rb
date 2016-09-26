require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(),
      Photo.create!()
    ])
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  xit "renders a list of photos" do
    render
  end
end
