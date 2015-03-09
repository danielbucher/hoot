class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  validates :content, length: { maximum: 140 }
  validates :content, presence: true

  scope :recent, ->(size) { order(updated_at: :desc).limit(size) }
end
