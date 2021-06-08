class ChangePricepointToBeIntegerInSubscriptions < ActiveRecord::Migration[5.2]
  def change
    change_column :subscriptions, :pricepoint, :integer
  end
end
