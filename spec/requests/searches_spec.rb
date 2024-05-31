require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe "POST #create" do
    context "with valid parameters" do
      it "logs a search query" do
        post :create, params: { search: { query: "Example search", ip_address: "127.0.0.1" } }
        expect(response).to have_http_status(:success)
        expect(Search.last.query).to eq("Example search")
      end
    end

    context "with invalid parameters" do
      it "fails to log with empty query" do
        post :create, params: { search: { query: "", ip_address: "127.0.0.1" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "fails to log without IP address" do
        post :create, params: { search: { query: "Example search" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
