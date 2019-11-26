require 'rails_helper'

RSpec.describe Create::Disc do
  describe "#call" do
    let(:artist)    { create(:artist, name: "Metallica") }
    let(:input)     { { artist: artist } }
    let(:response)  { subject.(input) }

    before do
      RSpotify::authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])
    end

    context "When the input is valid" do
      it "Should return a success response" do
        expect(Album.count).to be_zero

        expect(response.success?).to be_truthy

        expect(Album.count).to eq(14)

        expect(Album.all.last.name).to eq("Reload")
      end
    end

    context "The artist does not exist" do
      it "Should return a failure response" do
        input[:artist].name = "neeehhh"

        expect(response.success?).to be_falsey

        expected_response = "El artista no existe"

        expect(response.failure).to eq(expected_response)
        expect(Album.count).to be_zero
      end
    end
  end
end
