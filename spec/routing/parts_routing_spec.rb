require "rails_helper"

RSpec.describe PartsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/parts").to route_to("parts#index")
    end

    it "routes to #show" do
      expect(get: "/parts/1").to route_to("parts#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/parts").to route_to("parts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/parts/1").to route_to("parts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/parts/1").to route_to("parts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/parts/1").to route_to("parts#destroy", id: "1")
    end
  end
end
