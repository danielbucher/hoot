require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'home' do
    let(:user) { FactoryGirl.build(:user) }

    context 'with existing user' do
      before :each do
        User.expects(:find_by_user_name).with(user.user_name).returns(user)
        get :home, user_name: user.user_name
      end

      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template(:home) }
    end

    context 'with non-existing user' do
      before :each do
        User.expects(:find_by_user_name).with('moe').returns(nil)
        get :home, user_name: 'moe'
      end

      it { is_expected.to respond_with(:redirect) }
    end
  end
end
