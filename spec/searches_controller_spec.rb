require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @searches' do
      search = Search.create!(query: 'Test query', ip_address: '127.0.0.1')
      get :index
      expect(assigns(:searches)).to eq([search])
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Search' do
        expect {
          post :create, params: { search: { query: 'Valid query', ip_address: '127.0.0.1' } }, format: :json
        }.to change(Search, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: { search: { query: 'Valid query', ip_address: '127.0.0.1' } }, format: :json
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Search' do
        expect {
          post :create, params: { search: { query: '1234', ip_address: '127.0.0.1' } }, format: :json
        }.not_to change(Search, :count)
      end

      it 'returns an error response' do
        post :create, params: { search: { query: '1234', ip_address: '127.0.0.1' } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
