class AddDescriptionToCycleRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :cycle_routes, :description, :text
  end
end
