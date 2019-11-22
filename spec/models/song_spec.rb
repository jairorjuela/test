require 'rails_helper'

RSpec.describe Song, type: :model do
  subject { described_class.new }

  let(:album)   { create(:album) }

  describe "Associations" do
    it { should belong_to(:album) }
  end

  describe "Validations"do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:spotify_url) }
    it { is_expected.to validate_presence_of(:preview_url) }
    it { is_expected.to validate_presence_of(:duration_ms) }
    it { is_expected.to validate_presence_of(:spotify_id) }
  end

  describe "With valid attributes" do
    it "Should be valid with the correct attributes" do
      subject.name = "Test Artist"
      subject.spotify_url = "http://spotify.com/1"
      subject.preview_url = "http://preview_url.com/1"
      subject.duration_ms = 12
      subject.explicit = false
      subject.spotify_id = "123456"
      subject.album = album

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

    it "is invalid if duration_ms is not number type" do
      subject.duration_ms = "blah"

      expect(subject).to be_invalid
      expect(subject.errors[:duration_ms]).to eq(["El valor debe ser numerico"])
    end

    it "is invalid if total_tracks is not number type" do
      subject.album = nil

      expect(subject).to be_invalid
      expect(subject.errors[:album]).to eq(["La cancion debe tener un album"])
    end
  end
end
