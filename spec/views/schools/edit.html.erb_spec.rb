require 'rails_helper'

RSpec.describe "schools/edit", type: :view do

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

  it "renders the edit school form" do
    render

    assert_select "form[action=?][method=?]", school_path(@school), "post" do
    end
  end
end
