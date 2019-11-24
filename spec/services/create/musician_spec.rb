require 'rails_helper'

RSpec.describe Create::Musician do
  describe "#call" do
    let(:input)     { {:artist_name=>"Metallica"} }
    let(:response)  { subject.(input) }

    before do
      RSpotify::authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])
    end

    context "When the input is valid" do
      it "Should return a success response" do
        expect(Artist.count).to be_zero

        expect(response.success?).to be_truthy

        expect(Artist.count).to eq(1)

        expect(Artist.all.last.name).to eq("Metallica")
      end
    end

    context "The artist does not exist" do
      it "Should return a failure response" do
        input[:artist_name] = "neeehhh"

        expect(response.success?).to be_falsey

        expected_response = "El artista no existe"

        expect(response.failure).to eq(expected_response)
        expect(Artist.count).to be_zero
      end
    end
  end
end
