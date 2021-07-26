require 'rails_helper'

RSpec.describe '/cars', type: :request do
  # let!(:cars) { build_list(:car, 10) }
  # let(:car_id) { cars.first.id }
  describe 'GET /show' do
    # it 'renders a successful response' do
    #   # user1 = create(:user)
    #   car1 = create(:car)
    #   # get "http://localhost:3001/cars/#{car.id}"
    #   # expect(response).to have_http_status(200)
    #   # expect(json).not_to be_empty
    #   expect(car1.valid?).to be(10)
    # end
  end

  describe 'POST /create' do
    # context 'with valid parameters' do
    #   it 'creates a new Car' do
    #     post 'http://localhost:3001/cars',
    #          params: { car: { make: 'Camry', fuel: 60, power: 9, user_id: 1 }, user_id: 1, parts: [] }, as: :json
    #     expect(response).to have_http_status(200)
    #   end
    # end
    # context 'with invalid parameters' do
    #   it 'does not create a new User' do
    #     expect do
    #       post 'http://localhost:3001/cars',
    #            params: { car: { make: 'Camry', fuel: 60 }, parts: [] }, as: :json
    #     end.to change(User, :count).by(0)
    #   end
    # end
  end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested car' do
  #     expect do
  #       delete 'http://localhost:3001/cars/1', as: :json
  #     end.to change(Car, :count).by(-1)
  #   end
  # end
end
