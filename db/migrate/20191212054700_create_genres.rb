class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
    	t.string :genre_name, null: false
      t.datetime :deleted_at, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps

    end
      add_index :genres, :genre_name
  end
end
