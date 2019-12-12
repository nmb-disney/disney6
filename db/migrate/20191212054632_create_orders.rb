class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :user_id
      t.string :payment, null: false
      t.integer :total, null: false
      t.integer :deliver_fee, null: false
      t.integer :deliver_status, null: false
      t.integer :order_count, null: false
      t.integer :tax, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
