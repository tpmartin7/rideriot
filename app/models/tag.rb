class Tag < ApplicationRecord
  has_many :route_tags
  has_many :cycle_routes, through: :route_tags
end
