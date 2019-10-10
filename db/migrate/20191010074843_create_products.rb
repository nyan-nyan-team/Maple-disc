class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.integer :label_id
      t.integer :artist_id
      t.string :title
      t.string :image_id
      t.integer :amount
      t.integer :status
      t.datetime :release
      t.boolean :deleted_at

      t.timestamps
    end
  end
end
