require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    subject { FactoryGirl.build(:post) }

    it { is_expected.to validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_most(140) }
    it { should belong_to(:author) }
  end
end
