class AddDistanceAndRoutesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :distance_cycled, :float
    add_column :users, :routes_completed, :integer
  end
end
