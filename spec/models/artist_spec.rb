require 'rails_helper'

RSpec.describe Artist, type: :model do
  subject { described_class.new }

  describe "Association" do
    it { should have_many(:albums) }
  end

end
