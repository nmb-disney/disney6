class CreateRestocks < ActiveRecord::Migration[5.2]
  def change
    create_table :restocks do |t|
    	t.integer :cd_id, null: false
			t.datetime :restock_date, null: false
			t.integer :restock_count, null: false
			t.datetime :deleted_at, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
