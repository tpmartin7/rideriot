class AddCoordinatesToCycleRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :cycle_routes, :latitude, :float
    add_column :cycle_routes, :longitude, :float
  end
end
