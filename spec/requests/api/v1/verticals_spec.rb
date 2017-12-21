require 'rails_helper'

RSpec.describe 'Verticals API', type: :request do
  let(:user) { create(:user) }

  let!(:verticals) { create_list(:vertical, 3) }
  let(:vertical) { verticals.first }
  let(:id) { vertical.id }

  describe 'GET /api/v1/verticals' do
    before { get '/api/v1/verticals', params: {}, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns verticals' do
      expect(json).not_to be_empty
      expect(json['verticals'].size).to eq(3)
    end
  end

  describe 'GET /api/v1/verticals/:id' do
    before { get "/api/v1/verticals/#{id}", params: {}, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns vertical data' do
      expect(json['Name']).to eq(vertical.name)
    end
  end

  describe 'POST /api/v1/verticals' do
    let(:vertical_params) {{ vertical: attributes_for(:vertical) }}
    before { post '/api/v1/verticals', params: vertical_params, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns created vertical data' do
      expect(json['Name']).to eq(vertical_params[:vertical][:name])
    end
  end

  describe 'PATCH /api/v1/verticals/:id' do
    let(:vertical_params) { { vertical: { name: 'New name' } } }
    before { patch "/api/v1/verticals/#{id}", params: vertical_params, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns updated data' do
      expect(json['Name']).to eq('New name')
    end
  end

  describe 'DELETE /api/v1/verticals/:id' do
    before { delete "/api/v1/verticals/#{id}", params: {}, headers: jwt_header }

    it 'destroys vertical' do
      result = Vertical.all

      expect(result.map(&:id)).not_to include(id)
    end
  end

end
