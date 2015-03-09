class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :hashtags, join_table: 'posts_hashtags'

  validates :content, length: { maximum: 140 }
  validates :content, presence: true

  after_create do
    auto_create_hashtags
  end

  scope :recent, ->(size) { order(updated_at: :desc).limit(size) }

  def auto_create_hashtags
    self.detected_hashtags.each do |tag|
      hashtag = Hashtag.update_or_create(tag)
      self.hashtags << hashtag
    end
  end

  def detected_hashtags
    hashtags = self.content.scan(/#+\w+/)
  end
end
