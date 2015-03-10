class PostsController < ApplicationController

  def create
    @user = User.find_by_username(params[:username])
    @post = Post.new(content: params[:content])
    @post.author = @user

    respond_to do |format|
      if @post.save
        format.html { redirect_to controller: :users, action: :home,
           username: params[:username] }
        format.js   {}
      else
        format.html { redirect_to controller: :users, action: :home,
           username: params[:username] }
      end
    end
  end

  def with_tag
    @posts = Post.with_tag(params[:hashtag].downcase)

    render :index
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content)
  end
end
