require 'rails_helper'
RSpec.describe Api::V1::SongsController, type: :controller do

  describe "GET albums responds to" do
    context "JSON" do
      it "respose status 200" do
        artist1 = create(:artist, name: "Metallica", genres: "metal")
        artist2 = create(:artist, name: "Slayer", genres: "metal")
        artist3 = create(:artist, name: "Grupo Niche", genres: "salsa")
        album1 = create(:album, name: "Reload", artist: artist1)
        album2 = create(:album, name: "Show no mercy", artist: artist2)
        album3 = create(:album, name: "Vivir un sueño", artist: artist3)
        song1 =  create(:song,  name: "Reload 1", album: album1)
        song2 =  create(:song,  name: "Reload 2", album: album1)
        song3 =  create(:song,  name: "Reload 3", album: album2)
        song4 =  create(:song,  name: "Reload 4", album: album2)
        song5 =  create(:song,  name: "vivir un sueño", album: album3)

         get :random_song, :params => {"genre_name"=>"metal"}

        header = "application/json; charset=utf-8"

        expect(response.body).to include("Reload")
        expect(response.header['Content-Type']).to include(header)
        expect(response.status).to eq(200)
      end
    end
  end
end
