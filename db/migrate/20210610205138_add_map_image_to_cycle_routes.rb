class AddMapImageToCycleRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :cycle_routes, :map_image, :string
  end
end
