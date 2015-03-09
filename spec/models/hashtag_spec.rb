require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  context 'validations' do
    subject { FactoryGirl.build(:hashtag) }

    it { is_expected.to validate_presence_of(:content) }
    it { should have_and_belong_to_many(:posts) }
  end

  context 'creation' do
    let(:user) { FactoryGirl.create(:user) }

    it 'should add a hashtag to a post' do
      post = user.posts.create( FactoryGirl.attributes_for(:post) )
      hashtag = FactoryGirl.create(:hashtag)
      post.hashtags << hashtag

      expect(post.hashtags).to include(hashtag)
    end
  end
end
