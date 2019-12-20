class AddDefaultToCd < ActiveRecord::Migration[5.2]
  def change
  	change_column :cds, :stock, :integer, default: 0
  end
end
