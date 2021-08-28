class Comment < ApplicationRecord
  validates :user_comment, presence: true

  belongs_to :user
  belongs_to :topic
end
