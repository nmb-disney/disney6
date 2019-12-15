class AddDetailsToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :restock_id, :integer
    add_column :cds, :disc_id, :integer

  end
end
