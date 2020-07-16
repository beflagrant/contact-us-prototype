require 'rails_helper'

RSpec.describe "admin/cases/index", type: :view do
  before(:each) do
    assign(:admin_cases, [
      Admin::Case.create!(),
      Admin::Case.create!()
    ])
  end

  it "renders a list of admin/cases" do
    render
  end
end
