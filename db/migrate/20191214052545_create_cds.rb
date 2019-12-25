class CreateCds < ActiveRecord::Migration[5.2]
  def change
     create_table :cds do |t|
       t.integer :artist_id
       t.integer :label_id
       t.integer :genre_id
       t.string :cd_title, null: false
       t.string :jacket_image_id, null: false
       t.datetime :release_date, null: false
       t.integer :price, null: false
       t.integer :status ,null: false
       t.datetime :deleted_at, null: false
       t.datetime :created_at, null: false
       t.datetime :updated_at, null: false
       t.timestamps

    end
      add_index :cds, :cd_title
   end
end