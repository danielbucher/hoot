class Hashtag < ActiveRecord::Base

  has_and_belongs_to_many :posts, join_table: 'posts_hashtags'

  validates :content, presence: true
  validates :content, uniqueness: true

  before_create do
    self.content.downcase!
  end

  before_update do
    self.content.downcase!
  end

  def self.update_or_create(content)
    begin
      Hashtag.create!(content: content.downcase)
    rescue ActiveRecord::RecordInvalid
      Hashtag.find_by_content(content.downcase)
    end
  end
end
