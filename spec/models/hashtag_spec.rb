require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  context 'validations' do
    subject { FactoryGirl.build(:hashtag) }

    it { is_expected.to validate_presence_of(:content) }
  end
end
