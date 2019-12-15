class RemoveDeletedAtFromArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :deleted_at, :datetime
  end
end
