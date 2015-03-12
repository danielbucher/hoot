class HomeController < ApplicationController

  def index
    @posts = Post.recent
  end
end
