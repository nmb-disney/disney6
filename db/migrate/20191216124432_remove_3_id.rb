class Remove3Id < ActiveRecord::Migration[5.2]
  def change
    remove_column :cds, :restock_id, :integer
    remove_column :cds, :music_id, :integer
    remove_column :cds, :disc_id, :integer
  end
end
