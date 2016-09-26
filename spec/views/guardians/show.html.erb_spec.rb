require 'rails_helper'

RSpec.describe "guardians/show", type: :view do

  let(:valid_attributes) {
    {
      name: Faker::Name.name,
      phone: "910000000"
    }
  }


  before(:each) do
    @guardian = assign(:guardian, Guardian.create!(valid_attributes))
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  it "renders attributes in <p>" do
    render
  end
end
