class CreateCycleRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :cycle_routes do |t|
      t.string :name
      t.string :start_point
      t.string :end_point
      t.string :way_points
      t.float :distance
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
