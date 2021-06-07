class CreateRouteTags < ActiveRecord::Migration[6.0]
  def change
    create_table :route_tags do |t|
      t.references :cycle_route, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
