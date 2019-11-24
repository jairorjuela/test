require 'rails_helper'

RSpec.describe Create::Musicians do
  describe "#call" do
    let(:file_name) { "spec/fixtures/create_artists/success.yml" }
    let(:client)    { ENV["CLIENT_ID"] }
    let(:token)     { ENV["CLIENT_SECRET"] }
    let(:input)     { { file_name: file_name, client: client, token: token } }
    let(:response)  { subject.(input) }

    context "When the input is valid" do
      it "Should return a success response" do
        expect(response.success?).to be_truthy
        expect(Artist.count).to eq(21)

        names = Artist.all.map(&:name)
        expected_names = [
          "Metallica", "Nirvana", "Diomedes Diaz",
          "AC/DC", "311", "Calle 13", "BTS",
          "El Último De La Fila", "Alci Acosta",
          "Green Day", "Tormenta", "Chuck Berry",
          "Joe Cuba Sextet", "Compay Segundo",
          "Buena Vista Social Club", "Masacre",
          "Pantera", "Rubén Blades", "Los Hermanos Zuleta",
          "Carlos Vives", "Muse"
        ]

        expect(names).to match_array(expected_names)
      end
    end

    context "When the validate_input step fails" do
      context "The file path is wrong" do
        it "Should return a failure response" do
          input[:file_name] = nil

          expect(response.success?).to be_falsey

          expected_response = { file_name: ["La ruta del archivo es obligatorio"] }

          expect(response.failure).to eq(expected_response)
          expect(Artist.count).to be_zero
        end

        it "Should return a failure response" do
          input[:file_name] = "specz/fixtures/create_artists/success.yml"

          expect(response.success?).to be_falsey

          expected_response = { invalid_file: ["Verifique el archivo o la ruta de este"] }

          expect(response.failure).to eq(expected_response)
          expect(Artist.count).to be_zero
        end
      end

      context "The file_name param is empty" do
        it "Should return a failure response" do
          input.delete(:file_name)

          expect(response.success?).to be_falsey

          expected_response = { file_name: ["is missing"] }

          expect(response.failure).to eq(expected_response)
          expect(Artist.count).to be_zero
        end
      end

      context "The file_name extension is not yml" do
        it "Should return a failure response" do
          input[:file_name] = 'wrong_file.txt'

          expect(response.success?).to be_falsey

          expected_response = { invalid_file: ["Verifique el archivo o la ruta de este"] }

          expect(response.failure).to eq(expected_response)
          expect(Artist.count).to be_zero
        end
      end

      context "The file is empty" do
        it "Should return a failure response" do
          input[:file_name] = "spec/fixtures/create_artists/empty.yml"

          expect(response.success?).to be_falsey

          expected_response = { invalid_file: ["Verifique el archivo o la ruta de este"] }

          expect(response.failure).to eq(expected_response)
          expect(Artist.count).to be_zero
        end
      end
    end

    context "When the create_artist step fails" do
      context "When the artist does not exist" do
        it "Should return a failure response" do
          input[:file_name] = "spec/fixtures/create_artists/artist_does_not_exist.yml"

          expect(response.success?).to be_truthy
          expect(Artist.count).to eq(1)

          names = Artist.all.map(&:name)
          expected_names = ['Metallica']

          expect(names).to match_array(expected_names)
        end
      end

      context "When the artist is nil" do
        it "Should return a failure response" do
          input[:file_name] = "spec/fixtures/create_artists/artist_is_nil.yml"

          expect(response.success?).to be_truthy
          expect(Artist.count).to eq(0)
        end
      end

      context "When the artist does not exist in spotify" do
        it "Should return a success response" do
          input[:file_name] = "spec/fixtures/create_artists/artist_does_not_exist_in_spotify.yml"

          expect(response.success?).to be_truthy
          expect(Artist.count).to eq(0)
        end
      end
    end
  end
end
