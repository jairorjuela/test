require 'rails_helper'
RSpec.describe Api::V1::ArtistsController, type: :controller do
  let(:artist) { create(:artist) }

  describe "GET index responds to" do
    context "JSON" do
      it "respose status 200" do

        get :index, format: :json

        header = "application/json; charset=utf-8"

        expect(response.header['Content-Type']).to include(header)
        expect(response.status).to eq(200)
      end
    end
  end
end
