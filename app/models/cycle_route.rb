class CycleRoute < ApplicationRecord
  belongs_to :user
  has_many :attempts
  has_many :reviews
  has_many :route_tags
  has_many :tags, through: :route_tags
end
