class AddDetailToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :stock, :integer
  end
end
