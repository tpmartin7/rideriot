class CycleRoute < ApplicationRecord
  belongs_to :user
  has_many :attempts, dependent: :destroy
  has_many :reviews
  has_many :route_tags
  has_many :tags, through: :route_tags
  geocoded_by :start_point
  after_validation :geocode, if: :will_save_change_to_start_point?
end
