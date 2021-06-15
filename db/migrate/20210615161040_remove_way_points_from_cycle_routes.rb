class RemoveWayPointsFromCycleRoutes < ActiveRecord::Migration[6.0]
  def change
    remove_column :cycle_routes, :way_points, :string
  end
end
