class AddDetailsToList < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :label_id, :integer
    add_column :lists, :artist_id, :integer
    add_column :lists, :genre_id, :integer
  end
end
