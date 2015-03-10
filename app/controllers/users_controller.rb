class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    @user = User.find_by_username(params[:username])

    if @user
      @posts = @user.posts.recent(100)
    else
      render(:file => File.join(Rails.root, 'public/404.html'),
        :status => 404, :layout => false) unless @user
    end
  end
end
