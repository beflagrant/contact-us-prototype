require "rails_helper"

RSpec.describe Admin::CasesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/cases").to route_to("admin/cases#index")
    end

    it "routes to #show" do
      expect(get: "/admin/cases/1").to route_to("admin/cases#show", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/cases/1").to route_to("admin/cases#destroy", id: "1")
    end
  end
end
