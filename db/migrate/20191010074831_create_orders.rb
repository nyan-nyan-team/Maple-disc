class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :purchase_price_total
      t.integer :payment_method
      t.string :postage
      t.string :delivery_name
      t.string :delivery_postal_code
      t.string :delivery_address
      t.integer :delivery_status

      t.timestamps
    end
  end
end
