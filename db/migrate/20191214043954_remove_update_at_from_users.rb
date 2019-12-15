class RemoveUpdateAtFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :update_at, :datetime
  end
end
