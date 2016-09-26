require 'rails_helper'

RSpec.describe "guardians/edit", type: :view do

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

  it "renders the edit guardian form" do
    render

    assert_select "form[action=?][method=?]", guardian_path(@guardian), "post" do
    end
  end
end
