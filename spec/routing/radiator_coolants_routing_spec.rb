require "rails_helper"

RSpec.describe RadiatorCoolantsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/radiator_coolants").to route_to("radiator_coolants#index")
    end

    it "routes to #show" do
      expect(get: "/radiator_coolants/1").to route_to("radiator_coolants#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/radiator_coolants").to route_to("radiator_coolants#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/radiator_coolants/1").to route_to("radiator_coolants#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/radiator_coolants/1").to route_to("radiator_coolants#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/radiator_coolants/1").to route_to("radiator_coolants#destroy", id: "1")
    end
  end
end
