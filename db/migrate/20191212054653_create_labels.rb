class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
    	t.string :label_name, null: false
      t.datetime :deleted_at, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps

    end
      add_index :labels, :label_name
  end
end
