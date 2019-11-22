require 'rails_helper'

RSpec.describe Album, type: :model do
  subject { described_class.new }

  let(:artist)   { create(:artist) }

  describe "Associations" do
    it { should belong_to(:artist) }
  end

  describe "Validations"do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:spotify_id) }
  end

  describe "With valid attributes" do
    it "Should be valid with the correct attributes" do
      subject.name = "Test Artist"
      subject.image = "http://images.com/1"
      subject.spotify_url = "http://spotify.com/1"
      subject.total_tracks = 12
      subject.spotify_id = "123456"
      subject.artist = artist

      expect(subject).to be_valid
    end
  end

  describe "With a invalid attributes" do
    it "is invalid if name is NIL" do
      subject.name = nil

      expect(subject).to be_invalid
      expect(subject.errors[:name]).to eq(["El nombre es obligatorio"])
    end

    it "is invalid if spotify_id is NIL" do
      subject.spotify_id = nil

      expect(subject).to be_invalid
      expect(subject.errors[:spotify_id]).to eq(["El id de spotify es obligatorio"])
    end

    it "is invalid if total_tracks is not number type" do
      subject.total_tracks = "blah"

      expect(subject).to be_invalid
      expect(subject.errors[:total_tracks]).to eq(["El valor debe ser numerico"])
    end

    it "is invalid if total_tracks is not number type" do
      subject.artist = nil

      expect(subject).to be_invalid
      expect(subject.errors[:artist]).to eq(["El album debe tener un artista"])
    end
  end
end
