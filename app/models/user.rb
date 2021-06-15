class User < ApplicationRecord
  has_merit

  has_friendship
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_initialize :init

  def init
    self.distance_cycled ||= 0.0
    self.routes_completed ||= 0
  end
end
