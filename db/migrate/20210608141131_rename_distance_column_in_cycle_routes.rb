class RenameDistanceColumnInCycleRoutes < ActiveRecord::Migration[6.0]
  def change
    rename_column :cycle_routes, :distance, :total_distance
  end
end
