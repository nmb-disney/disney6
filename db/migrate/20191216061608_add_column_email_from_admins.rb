class AddColumnEmailFromAdmins < ActiveRecord::Migration[5.2]
  def change
  	add_column :admins, :email, :string, null: false, default: ""
  end
end
