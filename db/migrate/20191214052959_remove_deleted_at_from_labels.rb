class RemoveDeletedAtFromLabels < ActiveRecord::Migration[5.2]
  def change
    remove_column :labels, :deleted_at, :datetime
  end
end
