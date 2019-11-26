require 'rails_helper'

RSpec.describe Create::Melody do
  describe "#call" do
    let(:album)    { create(:album, name: "Death Magnetic") }
    let(:input)     { { album: album } }
    let(:response)  { subject.(input) }

    before do
      RSpotify::authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])
    end

    context "When the input is valid" do
      it "Should return a success response" do
        expect(Song.count).to be_zero

        expect(response.success?).to be_truthy

        expect(Song.count).to eq(10)

        expect(Song.all.last.name).to eq("My Apocalypse")
      end
    end

    context "The album does not exist" do
      it "Should return a failure response" do
        input[:album].name = "neeehhh"

        expect(response.success?).to be_falsey

        expected_response = "El artista no existe"

        expect(response.failure).to eq(expected_response)
        expect(Song.count).to be_zero
      end
    end
  end
end
