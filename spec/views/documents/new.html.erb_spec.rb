require 'rails_helper'

RSpec.describe "documents/new", type: :view do

  let(:valid_attributes) {
    {
      file_file_name: "O livro de Ruby",
      level: 1
    }
  }


  before(:each) do
    assign(:document, Document.new())
    params.merge!({:action => "Rspec"})
    params.merge!({:controller => "Testing"})
  end

  it "renders new document form" do
    render

    assert_select "form[action=?][method=?]", documents_path, "post" do
    end
  end
end
