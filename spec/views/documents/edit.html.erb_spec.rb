require 'rails_helper'

RSpec.describe "documents/edit", type: :view do

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

  it "renders the edit document form" do
    render

    assert_select "form[action=?][method=?]", document_path(@document), "post" do
    end
  end
end
