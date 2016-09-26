require 'rails_helper'

RSpec.describe "guardians/new", type: :view do

  let(:valid_attributes) {
    {
      name: Faker::Name.name,
      phone: "910000000"
    }
  }


  before(:each) do
    assign(:guardian, Guardian.new())
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  it "renders new guardian form" do
    render

    assert_select "form[action=?][method=?]", guardians_path, "post" do
    end
  end
end
