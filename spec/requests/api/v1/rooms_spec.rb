require 'rails_helper'

RSpec.describe 'Api::V1::Rooms', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/rooms/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/api/v1/rooms/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/api/v1/rooms/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/api/v1/rooms/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/api/v1/rooms/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
