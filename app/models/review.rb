class Review < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :review, length: {in: 10..300}
end
