require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    subject { FactoryGirl.build(:post) }

    it { is_expected.to validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_most(140) }
    it { should belong_to(:author) }
  end

  context 'ordering' do
    let(:user) { FactoryGirl.create(:user) }

    it 'should order by most recent' do
      user.posts.create(content: "Hello!")
      user.posts.create(content: "Bye!")
      recent_posts = Post.recent(2)

      expect(recent_posts.first.content).to eq("Bye!")
      expect(recent_posts.second.content).to eq("Hello!")
    end

  end
end
