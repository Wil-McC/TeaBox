class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :customer_id, foreign_key: true
      t.references :tea_id, foreign_key: true
      t.string :status
      t.integer :frequency
      t.float :pricepoint

      t.timestamps
    end
  end
end
