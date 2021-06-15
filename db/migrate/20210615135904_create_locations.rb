class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.text :description
      t.references :cycle_route, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
