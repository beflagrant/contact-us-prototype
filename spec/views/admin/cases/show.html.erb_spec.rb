require 'rails_helper'

RSpec.describe "admin/cases/show", type: :view do
  before(:each) do
    @admin_case = assign(:admin_case, Admin::Case.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
