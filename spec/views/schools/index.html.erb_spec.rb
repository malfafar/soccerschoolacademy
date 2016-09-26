require 'rails_helper'

RSpec.describe "schools/index", type: :view do
  before(:each) do
    assign(:schools, [
      School.create!(),
      School.create!()
    ])
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  xit "renders a list of schools" do
    render
  end
end
