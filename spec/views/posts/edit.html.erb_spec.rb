require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:valid_attributes) {
    {
      text: Faker::Hipster.sentence(12),
      title: Faker::Hipster.sentence(2),
      private: [true, false].sample
    }
  }

  before(:each) do
    @post = assign(:post, Post.create!(valid_attributes))
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do
    end
  end
end
