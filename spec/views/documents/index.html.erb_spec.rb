require 'rails_helper'

RSpec.describe "documents/index", type: :view do

  let(:valid_attributes) {
    {
      file_file_name: "O livro de Ruby",
      level: 1
    }
  }


  before(:each) do
    assign(:documents, [
      Document.create!(valid_attributes),
      Document.create!(valid_attributes)
    ])
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  xit "renders a list of documents" do
    render
  end
end
