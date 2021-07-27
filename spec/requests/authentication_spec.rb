require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  # Authentication test suite
  describe 'POST /auth/login' do
    # create test user
    let!(:user) { create(:user) }
    # set headers for authorization
    let(:headers) { valid_headers.except('Authorization') }
    # set test valid and invalid credentials
    let(:valid_credentials) do
      {
        user_name: user.user_name,
        password: user.password
      }.to_json
    end
    let(:invalid_credentials) do
      {
        user_name: '',
        password: ''
      }.to_json
    end

    context 'When request is valid' do
      before { post 'http://localhost:3001/auth/login', params: valid_credentials, headers: headers }
      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'When request is invalid' do
      before { post 'http://localhost:3001/auth/login', params: invalid_credentials, headers: headers }

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
