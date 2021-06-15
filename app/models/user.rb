class User < ApplicationRecord
  # has_merit

  has_friendship
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_initialize :init

  def init
    self.distance_cycled ||= 0.0
    self.routes_completed ||= 0
    self.points ||= 0
  end

  def set_badges
    self.update(bronze: DateTime.now) if bronze.nil? && routes_completed >= 1
    self.update(silver: DateTime.now) if silver.nil? && routes_completed >= 5
    self.update(gold: DateTime.now) if gold.nil? && routes_completed >= 20
  end

  def badges
    {
      bronze: {
        time_earned: bronze,
        desc: "You completed your first route!",
        cl_image: "rideriot/bronzeTrophy_wwtpnf.png"
      },
      silver: {
        time_earned: silver,
        desc: "5 Routes Completed!",
        cl_image: "rideriot/silverTrophy_ywnxo2.png"
      },
      gold: {
        time_earned: gold,
        desc: "20 routes completed!",
        cl_image: "rideriot/goldTrophy_qcx9kq.png"
      }
    }
  end
end
