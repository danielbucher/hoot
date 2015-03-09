class HomeController < ApplicationController

  def index
    @posts = Post.recent(10)
  end
end
