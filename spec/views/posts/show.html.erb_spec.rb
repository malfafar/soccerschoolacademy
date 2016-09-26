require 'rails_helper'

RSpec.describe "posts/show", type: :view do

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

  it "renders attributes in <p>" do
    render
  end
end
