class AddDeletedAtToLabels < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :deleted_at, :datetime
  end
end
