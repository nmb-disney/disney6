class CreateOrderCds < ActiveRecord::Migration[5.2]
  def change
    create_table :order_cds do |t|
    	t.integer :cd_id
      t.integer :order_id
      t.integer :order_cd_count, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
