class Hashtag < ActiveRecord::Base

  has_and_belongs_to_many :posts, join_table: 'posts_hashtags'

  validates :content, presence: true
end
