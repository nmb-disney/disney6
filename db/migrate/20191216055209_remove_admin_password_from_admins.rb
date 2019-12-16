class RemoveAdminPasswordFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :admin_password, :string
  end
end
