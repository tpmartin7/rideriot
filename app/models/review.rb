class Review < ApplicationRecord
  belongs_to :cycle_route
  belongs_to :user
end
