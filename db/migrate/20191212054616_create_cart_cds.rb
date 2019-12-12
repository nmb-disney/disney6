class CreateCartCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_cds do |t|
    	t.integer :user_id
      t.integer :cd_id
      t.integer :cart_count, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
