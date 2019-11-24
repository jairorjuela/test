require 'rails_helper'

RSpec.describe Create::Discs do
  describe "#call" do
    let(:artist)    { create(:artist, name: "Metallica") }
    let(:input)     { { artist: artist } }
    let(:response)  { subject.(input) }

    before do
      RSpotify::authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])
    end

    context "When the input is valid" do
      it "Should return a success response" do
        expect(response.success?).to be_truthy
        expect(Album.count).to eq(14)

        names = Album.all.map(&:name)
        expected_names = [
          "Helping Hands…Live & Acoustic At The Masonic",
          "Helping Hands...Live & Acoustic at The Masonic",
          "Hardwired…To Self-Destruct (Deluxe)",
          "Hardwired…To Self-Destruct",
          "Metallica Through The Never (Music From The Motion Picture)",
          "Metallica Through The Never (Music from the Motion Picture)",
          "Lulu",
          "Death Magnetic",
          "Some Kind Of Monster (Live)",
          "St. Anger",
          "S&M",
          "Garage, Inc.",
          "Garage Inc.",
          "Reload"
        ]

        expect(names).to match_array(expected_names)
      end
    end

    context "When the innput is not valid" do
      context "The file path is wrong" do
        it "Should return a failure response" do
          input[:artist] = nil

          expect(response.success?).to be_falsey

          expected_response = { :artist=>["must be filled"] }

          expect(response.failure).to eq(expected_response)
          expect(Album.count).to be_zero
        end

        it "Should return a failure response" do
          input[:artist] = "bkjadksahfq23r"

          expect(response.success?).to be_falsey

          expected_response = { :artist=>["must be Artist"] }

          expect(response.failure).to eq(expected_response)
          expect(Album.count).to be_zero
        end
      end
    end
  end
end
