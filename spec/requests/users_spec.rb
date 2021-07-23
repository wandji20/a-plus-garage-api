require 'rails_helper'

RSpec.describe 'users', type: :request do
  fixtures :users

  describe 'GET /show' do
    it 'renders a successful response' do
      User.create(name: 'Yohan', userID: '@yohan')
      get 'http://localhost:3001/users/4', as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post 'http://localhost:3001/users',
               params: { user: { name: 'moha', userID: 'ahmed' } }, as: :json
        end.to change(User, :count).by(1)
      end
    end
    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post 'http://localhost:3001/login',
               params: { user: { userID: 'ahmed' } }, as: :json
        end.to change(User, :count).by(0)
      end
    end
  end
end
