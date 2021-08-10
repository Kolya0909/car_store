class Comment < ApplicationRecord
  belongs_to :car
  validates :body, presence: true, length: {minimum:3}
end
