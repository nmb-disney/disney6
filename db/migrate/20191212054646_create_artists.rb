class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
    	t.string :artist_name, null: false
      t.datetime :deleted_at, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps

    end
      add_index :artists, :artist_name
  end
end
