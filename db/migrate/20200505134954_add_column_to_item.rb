class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :brand_id, :bigint
    add_foreign_key :items, :brands, column: :brand_id
    add_column :items, :prefecture_id, :integer
    
    remove_column :brands, :item, :integer
    remove_column :items, :delivery_area_id, :integer
  end
end
