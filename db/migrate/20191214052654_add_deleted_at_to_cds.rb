class AddDeletedAtToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :deleted_at, :datetime
  end
end
