class Hashtag < ActiveRecord::Base

  has_and_belongs_to_many :posts, join_table: 'posts_hashtags'

  validates :content, presence: true
  validates :content, uniqueness: true

  def self.update_or_create(content)
    begin
      Hashtag.create!(content: content)
    rescue ActiveRecord::RecordInvalid
      Hashtag.find_by_content(content).update!(content: content)
    end
  end
end
