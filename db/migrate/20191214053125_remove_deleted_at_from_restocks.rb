class RemoveDeletedAtFromRestocks < ActiveRecord::Migration[5.2]
  def change
    remove_column :restocks, :deleted_at, :datetime
  end
end
