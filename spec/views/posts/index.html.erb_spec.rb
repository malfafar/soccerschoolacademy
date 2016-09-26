require 'rails_helper'#   it "renders a list of practices" do


RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(),
      Post.create!()
    ])
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  xit "renders a list of posts" do
    render
  end
end
