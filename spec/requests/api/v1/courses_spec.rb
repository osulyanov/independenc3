require 'rails_helper'

RSpec.describe 'Courses API', type: :request do
  let(:user) { create(:user) }

  let(:category) { create(:category, vertical: create(:vertical)) }
  let!(:courses) { create_list(:course, 3, category: category) }
  let(:course) { courses.first }
  let(:id) { course.id }

  describe 'GET /api/v1/courses' do
    before { get '/api/v1/courses', params: {}, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns courses' do
      expect(json).not_to be_empty
      expect(json['courses'].size).to eq(3)
    end
  end

  describe 'GET /api/v1/courses/:id' do
    before { get "/api/v1/courses/#{id}", params: {}, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns course data' do
      expect(json['Name']).to eq(course.name)
    end
  end

  describe 'POST /api/v1/courses' do
    let(:course_params) do
      { course: attributes_for(:course, category_id: category.id) }
    end
    before { post '/api/v1/courses', params: course_params, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns created course data' do
      expect(json['Name']).to eq(course_params[:course][:name])
    end
  end

  describe 'PATCH /api/v1/courses/:id' do
    let(:course_params) { { course: { name: 'New name' } } }
    before { patch "/api/v1/courses/#{id}", params: course_params, headers: jwt_header }

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns updated data' do
      expect(json['Name']).to eq('New name')
    end
  end

  describe 'DELETE /api/v1/courses/:id' do
    before { delete "/api/v1/courses/#{id}", params: {}, headers: jwt_header }

    it 'destroys course' do
      result = Course.all

      expect(result.map(&:id)).not_to include(id)
    end
  end

end
