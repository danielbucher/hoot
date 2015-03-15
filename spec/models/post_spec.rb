require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    subject { FactoryGirl.build(:post) }

    it { is_expected.to validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_most(140) }
    it { should belong_to(:author) }
    it { should have_and_belong_to_many(:hashtags) }
  end

  let(:user) { FactoryGirl.create(:user) }

  context 'creation' do
    it 'should detect hashtag' do
      post = user.posts.create(content: "I'm going to #moes! #Bye")

      expect(post.hashtags.size).to eq(2)
      expect(post.hashtags[0].content).to eq("#moes")
      expect(post.hashtags[1].content).to eq("#bye")
    end
  end

  context 'ordering' do
    it 'should order by most recent' do
      user.posts.create(content: "Hello!")
      user.posts.create(content: "Bye!")
      recent_posts = Post.recent(2)

      expect(recent_posts.first.content).to eq("Bye!")
      expect(recent_posts.second.content).to eq("Hello!")
    end
  end

  context 'searching' do
    it 'should find all posts with given tag' do
      user.posts.create(content: "This is a #post!")
      user.posts.create(content: "This is anoter #Post with #tags in it")
      posts_with_tag = Post.with_tag("#post")

      expect(posts_with_tag[0].content).to eq ("This is anoter #Post with #tags in it")
      expect(posts_with_tag[1].content).to eq ("This is a #post!")
    end
  end

  context 'deletion' do
    it 'should destroy a post' do
      post = user.posts.create(FactoryGirl.attributes_for(:post))

      expect(Hashtag.find_by_content("#moe")).not_to be_nil
      post.destroy
      user.reload

      expect(user.posts).to be_empty
      expect(Hashtag.find_by_content("#moe")).to be_nil
    end
  end
end
