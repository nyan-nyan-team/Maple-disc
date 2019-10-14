class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id
      t.string :delivery_name
      t.string :delivery_postal_code
      t.string :delivery_address

      t.timestamps
    end
  end
end
