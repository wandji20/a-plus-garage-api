require 'rails_helper'

RSpec.describe '/admins', type: :request do
  fixtures :admins

  describe 'GET /index' do
    it 'renders a successful response' do
      get 'http://localhost:3001/api/v1/admins', as: :json
      json_response = JSON.parse(response.body)
      expect(json_response.length).to be(1)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      Admin.create(name: 'Yohan', adminID: '@yohan', email: 'yohan@email.com')
      get 'http://localhost:3001/api/v1/admins/1', as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Admin' do
        expect do
          post 'http://localhost:3001/api/v1/admins',
          params: { 
            admin: { 
              name: 'ahmed', 
              email: "@email.com", 
              adminID: '@ahmedsssss', 
            } 
          }, as: :json
        end.
        to change(Admin, :count).by(1)
 
      end
    end
    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post 'http://localhost:3001/api/v1/admins',
               params: { 
                  admin: {
                    name: 'ahmed', 
                    adminID: '@ahd', 
                    email: "@email.com",  
                    password: "111" } 
                }, as: :json
        end.
        to change(Admin, :count).by(0)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      expect do
        delete 'http://localhost:3001/api/v1/admins/1', as: :json
      end.to change(Admin, :count).by(-1)
    end
  end
end
