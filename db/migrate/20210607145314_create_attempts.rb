class CreateAttempts < ActiveRecord::Migration[6.0]
  def change
    create_table :attempts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cycle_route, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.boolean :completed

      t.timestamps
    end
  end
end
