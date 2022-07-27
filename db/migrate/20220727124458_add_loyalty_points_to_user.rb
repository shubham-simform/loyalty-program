class AddLoyaltyPointsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :loyalty_points, :integer, default: 0
  end
end
