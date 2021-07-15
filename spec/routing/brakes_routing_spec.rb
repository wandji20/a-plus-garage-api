require "rails_helper"

RSpec.describe BrakesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/brakes").to route_to("brakes#index")
    end

    it "routes to #show" do
      expect(get: "/brakes/1").to route_to("brakes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/brakes").to route_to("brakes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/brakes/1").to route_to("brakes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/brakes/1").to route_to("brakes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/brakes/1").to route_to("brakes#destroy", id: "1")
    end
  end
end
