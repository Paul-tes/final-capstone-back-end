require 'rails_helper'

RSpec.describe 'Api::V1::Reservations', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/reservations'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      post '/api/v1/reservations'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      delete '/api/v1/reservations'
      expect(response).to have_http_status(:success)
    end
  end
end
