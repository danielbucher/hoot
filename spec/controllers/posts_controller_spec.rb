require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'create' do
    let(:user) { FactoryGirl.create(:user) }

      context 'with proper content' do
        let(:hoot) { Post.new(content: "Hooting!") }

        before :each do
          User.expects(:find_by_username).with(user.username).returns(user)
          post :create, content: "Hooting!", username: user.username
        end

        it { is_expected.to respond_with(:redirect) }
      end
  end
end
