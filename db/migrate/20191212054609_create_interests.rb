class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
    	t.integer :user_id
      t.integer :cd_id
      t.datetime :created_at, null: false
      t.datetime :update_at, null: false

      t.timestamps
    end
  end
end
