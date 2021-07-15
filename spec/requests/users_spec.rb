require 'rails_helper'


RSpec.describe "api/v1/users", type: :request do
  fixtures :users
  
  
  describe "GET /index" do
    it "renders a successful response" do
      get 'http://localhost:3001/api/v1/users', as: :json
      json_response = JSON.parse(response.body)
      expect(json_response.length).to be(3)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      User.create( name:'Yohan', userID:'@yohan')
      get 'http://localhost:3001/api/v1/users/4', as: :json
      json_response = JSON.parse(response.body)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post 'http://localhost:3001/api/v1/users',
               params: { user: {name: 'moha', userID:'ahmed'} }, as: :json
        }.to change(User, :count).by(1)
      end
    end
    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post 'http://localhost:3001/api/v1/users',
                params: { user: { userID:'ahmed'} }, as: :json
        }.to change(User, :count).by(0)
      end
    end
  end



 

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      expect {
        delete 'http://localhost:3001/api/v1/users/3', as: :json
      }.to change(User, :count).by(-1)
    end
  end
end
