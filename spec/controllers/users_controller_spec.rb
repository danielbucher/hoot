require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'home' do
    let(:user) { FactoryGirl.build(:user) }

    context 'with existing user' do
      before :each do
        User.expects(:find_by_username).with(user.username).returns(user)
        get :home, username: user.username
      end

      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template(:home) }
    end

    context 'with non-existing user' do
      before :each do
        User.expects(:find_by_username).with('moe').returns(nil)
        get :home, username: 'moe'
      end

      it { is_expected.to respond_with(:redirect) }
    end
  end
end
