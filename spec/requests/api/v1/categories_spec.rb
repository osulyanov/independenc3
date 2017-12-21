require 'rails_helper'

RSpec.describe 'Categories API', type: :request do
  let(:user) { create(:user) }

  let(:vertical) { create(:vertical) }
  let!(:categories) { create_list(:category, 3, vertical: vertical) }
  let(:category) { categories.first }
  let(:id) { category.id }

  describe 'GET /api/v1/categories' do
    before { get '/api/v1/categories', params: {}, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns categories' do
      expect(json).not_to be_empty
      expect(json['categories'].size).to eq(3)
    end
  end

  describe 'GET /api/v1/categories/:id' do
    before { get "/api/v1/categories/#{id}", params: {}, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns category data' do
      expect(json['Name']).to eq(category.name)
    end
  end

  describe 'POST /api/v1/categories' do
    let(:category_params) do
      { category: attributes_for(:category, vertical_id: vertical.id) }
    end
    before { post '/api/v1/categories', params: category_params, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns created category data' do
      expect(json['Name']).to eq(category_params[:category][:name])
    end
  end

  describe 'PATCH /api/v1/categories/:id' do
    let(:category_params) { { category: { name: 'New name' } } }
    before { patch "/api/v1/categories/#{id}", params: category_params, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns updated data' do
      expect(json['Name']).to eq('New name')
    end
  end

  describe 'DELETE /api/v1/categories/:id' do
    before { delete "/api/v1/categories/#{id}", params: {}, headers: jwt_header }

    it 'destroys category' do
      result = Category.all

      expect(result.map(&:id)).not_to include(id)
    end
  end

end
