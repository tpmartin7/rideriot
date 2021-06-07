class CycleRoute < ApplicationRecord
  belongs_to :user
  has_many :attempts, :reviews, :route_tags
  has_many :tags, through: :route_tags
end
