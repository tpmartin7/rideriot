class AddBadgesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bronze, :datetime, default: nil
    add_column :users, :silver, :datetime, default: nil
    add_column :users, :gold, :datetime, default: nil
  end
end
