class AddCommentToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :comment, :string
  end
end
