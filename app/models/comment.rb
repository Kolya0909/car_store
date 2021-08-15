class Comment < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :body, presence: true, length: {minimum:3}
end
