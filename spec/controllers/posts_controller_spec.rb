require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'create' do
    let(:user) { FactoryGirl.create(:user) }

      context 'with proper content' do
        let(:hoot) { FactoryGirl.build(:hoot_with_author) }

        before :each do
          User.expects(:find_by_username).with(user.username).returns(user)
          Post.any_instance.expects(:save).returns(true)

          post :create, content: hoot.content, username: user.username
        end

        it { is_expected.to respond_with(:redirect) }
      end

      context 'with proper content' do
        let(:hoot) { FactoryGirl.build(:hoot_with_author) }

        before :each do
          User.expects(:find_by_username).with(user.username).returns(user)
          Post.any_instance.expects(:save).returns(false)

          post :create, content: '', username: user.username
        end

        it { is_expected.to respond_with(:redirect) }
      end
  end

  describe 'with_tag' do
    let(:user) { FactoryGirl.create(:user) }
    let(:post) { user.posts.create(FactoryGirl.attributes_for(:post)) }

    before :each do
      Post.expects(:with_tag).with('#moe').returns([post])

      get :with_tag, hashtag: '#moe'
    end

    it { is_expected.to respond_with(:success) }
    it { expect(assigns(:posts)).to match_array([post])}
  end
end
