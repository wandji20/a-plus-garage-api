require "rails_helper"

RSpec.describe RearLightsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rear_lights").to route_to("rear_lights#index")
    end

    it "routes to #show" do
      expect(get: "/rear_lights/1").to route_to("rear_lights#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/rear_lights").to route_to("rear_lights#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/rear_lights/1").to route_to("rear_lights#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/rear_lights/1").to route_to("rear_lights#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/rear_lights/1").to route_to("rear_lights#destroy", id: "1")
    end
  end
end
