class Cds < ActiveRecord::Migration[5.2]
  def down
    remove_column :cds, :restock_id, :integer
    remove_column :cds, :music_id, :integer
    remove_column :cds, :disc_id, :integer
  end
end
