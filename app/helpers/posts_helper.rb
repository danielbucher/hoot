module PostsHelper

  def short_post_date(post_id)
    post = Post.find(post_id)
    post.updated_at.strftime("%b %d %Y %H:%M")
  end
end
