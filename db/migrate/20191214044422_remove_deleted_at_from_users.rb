class RemoveDeletedAtFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :deleted_at, :datetime
  end
end
