require 'rails_helper'

RSpec.describe Create::Melodies do
  describe "#call" do
    let(:album)    { create(:album, name: "Death Magnetic") }
    let(:input)     { { album: album } }
    let(:response)  { subject.(input) }

    before do
      RSpotify::authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])
    end

    context "When the input is valid" do
      it "Should return a success response" do
        expect(response.success?).to be_truthy
        expect(Song.count).to eq(10)

        names = Song.all.map(&:name)

        expected_names = [
          "That Was Just Your Life",
          "The End Of The Line",
          "Broken, Beat & Scarred",
          "The Day That Never Comes",
          "All Nightmare Long",
          "Cyanide",
          "The Unforgiven III",
          "The Judas Kiss",
          "Suicide & Redemption",
          "My Apocalypse"
        ]

        expect(names).to match_array(expected_names)
      end
    end

    context "When the innput is not valid" do
      context "The file path is wrong" do
        it "Should return a failure response" do
          input[:album] = nil

          expect(response.success?).to be_falsey

          expected_response = { :album=>["must be filled"] }

          expect(response.failure).to eq(expected_response)
          expect(Song.count).to be_zero
        end

        it "Should return a failure response" do
          input[:album] = "bkjadksahfq23r"

          expect(response.success?).to be_falsey

          expected_response = { :album=>["must be Album"] }

          expect(response.failure).to eq(expected_response)
          expect(Song.count).to be_zero
        end
      end
    end
  end
end
