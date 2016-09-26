require 'rails_helper'

RSpec.describe "documents/show", type: :view do

  let(:valid_attributes) {
    {
      file_file_name: "O livro de Ruby",
      level: 1
    }
  }


  before(:each) do
    @document = assign(:document, Document.create!(valid_attributes))
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  it "renders attributes in <p>" do
    render
  end
end
