require 'rails_helper'

RSpec.describe Artist, type: :model do
  subject { described_class.new }

  describe "Association" do
    it { should have_many(:albums) }
  end

  describe "Validations"do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:genres) }
    it { is_expected.to validate_presence_of(:popularity) }
    it { is_expected.to validate_presence_of(:spotify_url) }
    it { is_expected.to validate_presence_of(:spotify_id) }
  end

  describe "With valid attributes" do
    it "Should be valid with the correct attributes" do
      subject.name = "Test Artist"
      subject.image = "http://images.com/1"
      subject.genres = "Test"
      subject.popularity = 12
      subject.spotify_url = "http://spotify.com/1"
      subject.spotify_id = "123456"

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

    it "is invalid if popularity is not number type" do
      subject.popularity = "blah"

      expect(subject).to be_invalid
      expect(subject.errors[:popularity]).to eq(["El valor debe ser numerico"])
    end
  end
end
