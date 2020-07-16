require 'rails_helper'

RSpec.describe "admin/cases/edit", type: :view do
  before(:each) do
    @admin_case = assign(:admin_case, Admin::Case.create!())
  end

  it "renders the edit admin_case form" do
    render

    assert_select "form[action=?][method=?]", admin_case_path(@admin_case), "post" do
    end
  end
end
