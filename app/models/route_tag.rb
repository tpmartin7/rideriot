class RouteTag < ApplicationRecord
  belongs_to :cycle_route
  belongs_to :tag
end
