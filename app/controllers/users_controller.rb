class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    @user = User.find_by_user_name(params[:user_name])

    redirect_to controller: :home, action: :index unless @user
  end
end
