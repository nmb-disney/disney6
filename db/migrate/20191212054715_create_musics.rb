class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
    	t.integer :disc_id, null: false
	  	t.integer :music_rank, null: false
	  	t.string :music_title, null: false
	  	t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps

    end
       add_index :musics, :music_title
  end
end
