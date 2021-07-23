require 'rails_helper'

RSpec.describe '/parts', type: :request do
  fixtures :parts

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Part" do
        expect do
          post 'http://localhost:3001/users/2/cars/1/parts',
               params: { part: { name: 'Oil', life: 3, count: 1, car_id: 1 }, car_id: 1},   as: :json
        end.to change(Part, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "creates a new Part" do
        expect do
          post 'http://localhost:3001/users/2/cars/1/parts',
               params: { part: { name: 'Oil',count: 1}, car_id: 1},   as: :json
        end.to change(Part, :count).by(0)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do

      it "updates a Part" do
        put 'http://localhost:3001/users/1/cars/1/parts/1',
             params: { count: 2},   as: :json
        json_response = JSON.parse(response.body)
        expect(response).to be_successful
      end

      it "does not updates a Part" do
        put 'http://localhost:3001/users/1/cars/1/parts/1',
             params: { year: 2},   as: :json
        json_response = JSON.parse(response.body)
        expect(response).to_not be_successful
      end
    end

  end

end
