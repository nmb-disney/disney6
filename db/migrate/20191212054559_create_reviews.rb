class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.integer :user_id
      t.integer :cd_id
      t.string :comment, null: false
      t.datetime :created_at, null: false
      t.datetime :update_at, null: false

      t.timestamps
    end
  end
end
