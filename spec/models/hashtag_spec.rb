require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  context 'validations' do
    subject { FactoryGirl.build(:hashtag) }

    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_uniqueness_of(:content) }
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

    it 'should update or create hashtags' do
      Hashtag.find_or_create_by(content: "#something")
      Hashtag.find_or_create_by(content: "#something")

      expect(Hashtag.where(content: "#something").count).to eq(1)
    end

    it 'should downcase content' do
      Hashtag.find_or_create_by(content: "#FuN")

      expect(Hashtag.find_by_content("#FuN")).to be_nil
      expect(Hashtag.find_by_content("#fun")).not_to be_nil
    end
  end
end
