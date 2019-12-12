class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
    	t.integer :cd_id, null: false
	  	t.integer :disc_rank, null: false
      t.string :disc_title, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps

    end
      add_index :discs, :disc_title
  end
end
