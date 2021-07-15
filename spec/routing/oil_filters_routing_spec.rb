require "rails_helper"

RSpec.describe OilFiltersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/oil_filters").to route_to("oil_filters#index")
    end

    it "routes to #show" do
      expect(get: "/oil_filters/1").to route_to("oil_filters#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/oil_filters").to route_to("oil_filters#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/oil_filters/1").to route_to("oil_filters#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/oil_filters/1").to route_to("oil_filters#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/oil_filters/1").to route_to("oil_filters#destroy", id: "1")
    end
  end
end
