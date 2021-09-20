require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }

  let(:valid_attributes) do
    { user: { name: user.name, user_name: user.user_name, password: user.password,
              password_confirmation: user.password } }
  end
  let(:invalid_attributes) do
    attributes_for(:user)
  end

  describe 'POST /create' do
    context 'when valid request' do
      before do
        post 'http://localhost:3001/signup',
             params: valid_attributes.to_json,
             headers: headers
      end

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post 'http://localhost:3001/signup', params: { user: { name: user.name } }.to_json, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(
            /Validation failed:/
          )
      end
    end
  end
end
