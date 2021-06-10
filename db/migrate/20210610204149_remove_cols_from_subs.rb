class RemoveColsFromSubs < ActiveRecord::Migration[5.2]
  def change
    remove_column :subscriptions, :customer_id
    remove_column :subscriptions, :tea_id
  end
end
