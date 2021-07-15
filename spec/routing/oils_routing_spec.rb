require "rails_helper"

RSpec.describe OilsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/oils").to route_to("oils#index")
    end

    it "routes to #show" do
      expect(get: "/oils/1").to route_to("oils#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/oils").to route_to("oils#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/oils/1").to route_to("oils#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/oils/1").to route_to("oils#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/oils/1").to route_to("oils#destroy", id: "1")
    end
  end
end
