class AddDtailsToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :music_id, :integer
  end
end
