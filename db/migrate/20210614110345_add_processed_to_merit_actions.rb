class AddProcessedToMeritActions < ActiveRecord::Migration[6.0]
  def change
    add_index :merit_actions, :processed
  end
end
