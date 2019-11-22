require 'rails_helper'

RSpec.describe Album, type: :model do
  subject { described_class.new }

  let(:artist)   { create(:artist) }

  describe "Associations" do
    it { should belong_to(:artist) }
  end
end
