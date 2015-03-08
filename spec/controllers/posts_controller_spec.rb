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
end
