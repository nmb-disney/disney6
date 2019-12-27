class RemovejacketImageIdFromCds < ActiveRecord::Migration[5.2]
  def change
    remove_column :cds, :jacket_image_id, :string
  end
end
