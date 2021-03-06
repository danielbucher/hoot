class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :hashtags, join_table: 'posts_hashtags'

  validates :content, length: { maximum: 140 }
  validates :content, presence: true

  after_create do
    auto_create_hashtags
  end

  before_destroy do
    self.hashtags.each do |tag|
      tag.destroy if ( tag.posts.count == 1 && tag.posts[0] == self )
    end
  end

  scope :recent, ->(*size) { size.nil? ? order(updated_at: :desc).limit(size) :  order(updated_at: :desc)}
  scope :with_tag, ->(hashtag) { joins(:hashtags).
                                    where('hashtags.content' => hashtag).
                                    recent(100) }

  def auto_create_hashtags
    self.detected_hashtags.each do |tag|
      hashtag = Hashtag.find_or_create_by(content: tag.downcase)
      self.hashtags << hashtag
    end
  end

  def detected_hashtags
    hashtags = self.content.scan(/#+\w+/)
  end
end
