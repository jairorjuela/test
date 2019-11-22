require 'rails_helper'

RSpec.describe CreateArtists::Execute do
  describe "#call" do
    let(:file)     { File.read("#{Rails.root}/spec/fixtures/create_artists/success.yml") }
    let(:input)    { file: file }
    let(:response) { subject.(input) }

    context "When the input is valid" do
      it "Should return a success response" do
        expect(response.success?).to be_truthy
        expect(Artist.count).to eq(3)

        names = Artist.all.map(&:name)
        expected_names = ['Pepito', 'Jeronimo', 'Appa']

        expect(names).to match_array(expected_names)
      end
    end

    context "When the read_file step fails" do
      it "Should return a failure response" do
        
      end
    end

    context "When the create_artist step fails" do
      it "Should return a failure response" do
        
      end
    end
  end
end
