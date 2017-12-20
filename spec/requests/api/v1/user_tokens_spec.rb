require 'rails_helper'

RSpec.describe 'User Tokens API', type: :request do

  xit 'cannot access app when not logged in' do
    get '/api/v1/categories'
    expect(response).to have_http_status(401)
  end

  describe 'POST /api/v1/user_token' do
    let(:user) { create(:user, password: 'password') }
    let(:params) { { auth: { email: user.email, password: 'password' } } }

    before { post '/api/v1/user_token', params: params }

    context 'valid user data' do
      it 'returns success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns jwt code' do
        expect(json['jwt']).not_to be_empty
      end
    end

    context 'invalid user data' do
      let(:params) { { auth: { email: user.email, password: 'invalid' } } }

      it 'returns not found' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns empty' do
        expect(response.body).to be_empty
      end
    end
  end

end
