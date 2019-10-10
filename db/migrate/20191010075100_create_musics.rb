class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.integer :disc_id
      t.string :music_name
      t.integer :song_order

      t.timestamps
    end
  end
end
