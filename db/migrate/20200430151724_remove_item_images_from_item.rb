class RemoveItemImagesFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :item_images, :item, :integer
  end
end
