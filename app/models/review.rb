class Review < ApplicationRecord
  belongs_to :cycle_route
  belongs_to :user
  validates :rating, length: { maximum: 5, too_long: "5 stars is the maximum allowed" }
  validates :rating, presence: true
  validates :comment, presence: true
end
