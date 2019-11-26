require 'rails_helper'
RSpec.describe Api::V1::ArtistsController, type: :controller do

  describe "GET albums responds to" do
    context "JSON" do
      it "respose status 200" do
        artist = create(:artist, name: "Metallica")
        album = create(:album, name: "Reload", artist: artist)

        get :albums, params: {id: artist.id}

        header = "application/json; charset=utf-8"

        expect(response.body).to include("Reload")
        expect(response.header['Content-Type']).to include(header)
        expect(response.status).to eq(200)
      end
    end
  end
end
