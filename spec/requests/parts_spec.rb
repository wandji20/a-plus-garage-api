require 'rails_helper'

RSpec.describe '/parts', type: :request do
  let(:user) { create(:user) }
  let!(:cars) { create_list(:car, 10, user_id: user.id) }
  let(:car_id) { cars.first.id }
  let(:part) { create(:part, car_id: car_id) }
  let(:part_id) { part.id }
  let(:headers) { valid_headers }

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Part' do
        expect do
          post "http://localhost:3001/cars/#{car_id}/parts",
               params: { part: { name: 'Oil', life: 3, count: 1, car_id: car_id } }, headers: headers, as: :json
        end.to change(Part, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'creates a new Part' do
        expect do
          post "http://localhost:3001/cars/#{car_id}/parts",
               params: { part: { name: 'Oil', life: 3, count: 1 } }, headers: headers, as: :json
        end.to change(Part, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates a Part' do
        put "http://localhost:3001/cars/#{car_id}/parts/#{part_id}",
            params: { count: 3, car_id: car_id }, headers: headers, as: :json
        expect(response).to be_successful
      end

      it 'updates a Part' do
        put "http://localhost:3001/cars/#{car_id}/parts/#{part_id}",
            params: { year: 3 }, headers: headers, as: :json
        expect(response).to_not be_successful
      end
    end
  end
end
