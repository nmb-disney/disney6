class AddLastnameToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :lastname, :string
  end
end
