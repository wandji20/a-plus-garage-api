require 'rails_helper'

RSpec.describe 'cars API', type: :request do
  # add cars owner
  let(:user) { create(:user) }
  let!(:cars) { create_list(:car, 10, user_id: user.id) }
  let(:car_id) { cars.first.id }
  # authorize request
  let(:headers) { valid_headers }

  describe 'GET /cars' do
    # update request with headers
    before { get 'http://localhost:3001/cars', params: {}, headers: headers }

    # [...]
  end

  describe 'GET /cars/:id' do
    before { get "/cars/#{car_id}", params: {}, headers: headers }
    # [...]
  end
  # [...]
end

describe 'POST /cars' do
  let(:valid_attributes) do
    # send json payload
    { make: 'Learn Elm', user_id: user.id.to_s, fuel: 3, power: 7 }.to_json
  end

  context 'when request is valid' do
    before { post 'http://localhost:3001/cars', params: valid_attributes, headers: headers }
    # [...]
  end

  context 'when the request is invalid' do
    let(:invalid_attributes) { { user_name: nil }.to_json }
    before { post 'http://localhost:3001/cars', params: invalid_attributes, headers: headers }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end
  end

  describe 'PUT /cars/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/cars/#{car_id}", params: valid_attributes, headers: headers }
      # [...]
    end
  end
end
