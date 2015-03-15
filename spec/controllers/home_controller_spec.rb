require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'index' do
    let(:user) { FactoryGirl.create(:user) }

    context 'with hoots' do
      let(:first_post) { user.posts.create(FactoryGirl.attributes_for(:post)) }
      let(:second_post) { user.posts.create(FactoryGirl.attributes_for(:another_post)) }

      before :each do
        Post.expects(:recent).returns([second_post, first_post])
        get :index
      end

      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template(:index) }
      it { expect(assigns(:posts)).to match_array([second_post, first_post])}
    end
  end
end
