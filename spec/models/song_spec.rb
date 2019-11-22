require 'rails_helper'

RSpec.describe Song, type: :model do
  subject { described_class.new }

  let(:album)   { create(:album) }

  describe "Associations" do
    it { should belong_to(:album) }
  end
end
