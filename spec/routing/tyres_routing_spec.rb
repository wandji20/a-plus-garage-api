require "rails_helper"

RSpec.describe TyresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tyres").to route_to("tyres#index")
    end

    it "routes to #show" do
      expect(get: "/tyres/1").to route_to("tyres#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tyres").to route_to("tyres#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tyres/1").to route_to("tyres#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tyres/1").to route_to("tyres#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tyres/1").to route_to("tyres#destroy", id: "1")
    end
  end
end
