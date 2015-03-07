class PostsController < ApplicationController

  def create
    @user = User.find_by_username(params[:username])
    @post = @user.posts.create(content: params[:content])

    redirect_to controller: :users, action: :home,
      username: params[:username]
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content)
    end
end
