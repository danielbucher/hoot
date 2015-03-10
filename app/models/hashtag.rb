class Hashtag < ActiveRecord::Base

  has_and_belongs_to_many :posts, join_table: 'posts_hashtags'

  validates :content, presence: true, uniqueness: true

  before_save do
    self.content.downcase!
  end

  def self.find_or_create_by(attributes, &block)
    attributes[:content].downcase!
    super(attributes, &block)
  end
end
