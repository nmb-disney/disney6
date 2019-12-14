class RemoveUpdateAtFromInterests < ActiveRecord::Migration[5.2]
  def change
    remove_column :interests, :update_at, :datetime
  end
end
