class AddjacketImageIdToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :jacket_image_id, :string
  end
end
