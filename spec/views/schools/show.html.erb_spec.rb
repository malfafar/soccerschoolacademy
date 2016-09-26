require 'rails_helper'

RSpec.describe "schools/show", type: :view do

  let(:valid_attributes) {
    {
      name: Faker::University.name
    }
  }

  before(:each) do
    @school = assign(:school, School.create!(valid_attributes))
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  it "renders attributes in <p>" do
    render
  end
end
