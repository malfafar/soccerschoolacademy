require 'rails_helper'

RSpec.describe "guardians/index", type: :view do
  before(:each) do
    assign(:guardians, [
      Guardian.create!(),
      Guardian.create!()
    ])
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  xit "renders a list of guardians" do
    render
  end
end
