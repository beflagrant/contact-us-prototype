require "rails_helper"

RSpec.describe Admin::CasesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/cases").to route_to("admin/cases#index")
    end

    it "routes to #new" do
      expect(get: "/admin/cases/new").to route_to("admin/cases#new")
    end

    it "routes to #show" do
      expect(get: "/admin/cases/1").to route_to("admin/cases#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/cases/1/edit").to route_to("admin/cases#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/cases").to route_to("admin/cases#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/cases/1").to route_to("admin/cases#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/cases/1").to route_to("admin/cases#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/cases/1").to route_to("admin/cases#destroy", id: "1")
    end
  end
end
