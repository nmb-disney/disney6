class RemoveDeletedAtFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :deleted_at, :datetime
  end
end
