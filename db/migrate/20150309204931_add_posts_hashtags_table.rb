class AddPostsHashtagsTable < ActiveRecord::Migration
  def change
    create_table :posts_hashtags, id: false do |t|
      t.belongs_to :post, index: true
      t.belongs_to :hashtag, index: true
    end
  end
end
