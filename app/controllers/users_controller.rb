class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    @user = User.find_by_username(params[:username])

    redirect_to controller: :home, action: :index unless @user
  end
end
