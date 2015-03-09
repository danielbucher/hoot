class Hashtag < ActiveRecord::Base

  validates :content, presence: true
end
