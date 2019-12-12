class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
    	t.integer :user_id
      t.string :add_postalcode
      t.string :add_address
      t.string :add_lastname
      t.string :add_firstname

      t.timestamps
    end
  end
end
