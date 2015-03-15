class PostsController < ApplicationController
  before_action :store_current_page, only: [:destroy]
  after_action :clear_current_page, only: [:destroy]
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @user = User.find_by_username(params[:username])

    if @user == current_user
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
    else
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end

  def with_tag
    @posts = Post.with_tag("\##{params[:hashtag]}".downcase)

    render :index
  end

  def destroy
    @post = Post.find(params[:id].to_i)
    @post.destroy

    redirect_to session[:current_page]
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content)
  end

  def store_current_page
    session[:current_page] = request.referrer || root_path
  end

  def clear_current_page
    session.delete(:current_page)
  end
end
