require 'rails_helper'
RSpec.describe Api::V1::AlbumsController, type: :controller do

  describe "GET index responds to" do
    context "JSON" do
      it "respose status 200" do
        album = create(:album, name: "St. Anger")
        songs = create(:song, name: "Frantic", album: album)

        get :songs, params: {id: album.id}

        header = "application/json; charset=utf-8"

        expect(response.body).to include("Frantic")
        expect(response.header['Content-Type']).to include(header)
        expect(response.status).to eq(200)
      end
    end
  end
end
