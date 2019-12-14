class AddDeletedAtToRestocks < ActiveRecord::Migration[5.2]
  def change
    add_column :restocks, :deleted_at, :datetime
  end
end
