require 'rails_helper'

RSpec.describe "admin/cases/new", type: :view do
  before(:each) do
    assign(:admin_case, Admin::Case.new())
  end

  it "renders new admin_case form" do
    render

    assert_select "form[action=?][method=?]", admin_cases_path, "post" do
    end
  end
end
