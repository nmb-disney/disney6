class RemoveUpdateAtFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :update_at, :datetime
  end
end
