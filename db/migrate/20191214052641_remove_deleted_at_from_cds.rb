class RemoveDeletedAtFromCds < ActiveRecord::Migration[5.2]
  def change
    remove_column :cds, :deleted_at, :datetime
  end
end
