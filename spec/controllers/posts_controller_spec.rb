require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'create' do
    let(:user) { FactoryGirl.create(:user) }

      context 'with proper content' do
        let(:hoot) { FactoryGirl.build(:hoot_with_author) }

        before :each do
          posts = mock()
          User.expects(:find_by_username).with(user.username).returns(user)
          user.expects(:posts).returns(posts)
          posts.expects(:create).with(content: hoot.content).returns(hoot)

          post :create, content: hoot.content, username: user.username
        end

        it { is_expected.to respond_with(:redirect) }
      end
  end
end
