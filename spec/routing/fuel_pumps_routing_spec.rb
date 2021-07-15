require "rails_helper"

RSpec.describe FuelPumpsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/fuel_pumps").to route_to("fuel_pumps#index")
    end

    it "routes to #show" do
      expect(get: "/fuel_pumps/1").to route_to("fuel_pumps#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/fuel_pumps").to route_to("fuel_pumps#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/fuel_pumps/1").to route_to("fuel_pumps#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/fuel_pumps/1").to route_to("fuel_pumps#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/fuel_pumps/1").to route_to("fuel_pumps#destroy", id: "1")
    end
  end
end
