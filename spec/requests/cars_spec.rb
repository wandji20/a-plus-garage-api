require 'rails_helper'

RSpec.describe '/cars', type: :request do
  fixtures :cars, :users

  describe "GET /index" do
    it "renders a successful response" do
      get 'http://localhost:3001/api/v1/users/1/cars', as: :json
      json_response = JSON.parse(response.body)
      expect(json_response.length).to be(1)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Car' do
        # expect do
          post 'http://localhost:3001/api/v1/users/2/cars',
               params: { car: { make: 'Camry', fuel_rate: 60 , horse_power: 9, user_id:2 } }, as: :json
          json_response = JSON.parse(response.body)
          expect(json_response).to be(1)
        # end.to change(Car, :count).by(1)
        expect
      end
    end
    # context 'with invalid parameters' do
    #   it 'does not create a new User' do
    #     expect do
    #       post 'http://localhost:3001/api/v1/users',
    #            params: { user: { userID: 'ahmed' } }, as: :json
    #     end.to change(User, :count).by(0)
    #   end
    # end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested car' do
      expect do
        delete 'http://localhost:3001/api/v1/users/1/cars/1', as: :json
      end.to change(Car, :count).by(-1)
    end
  end
end
