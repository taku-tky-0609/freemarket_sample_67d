class RenameDeliveryMethodColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :delivery_method, :delivery_method_id
    rename_column :items, :delivery_fee, :delivery_fee_id
    rename_column :items, :delivery_area, :delivery_area_id
    rename_column :items, :estimated_delivery, :estimated_delivery_id
    rename_column :items, :status, :status_id
    
    change_column :items, :delivery_method_id, :integer
    change_column :items, :delivery_fee_id, :integer
    change_column :items, :status_id, :integer
    change_column :items, :estimated_delivery_id, :integer
    
    add_column :items, :brand_id, :bigint
    add_foreign_key :items, :brands, column: :brand_id
    add_column :items, :prefecture_id, :integer

    rename_column :item_images, :item, :item_id
    rename_column :item_images, :image, :src
    
    remove_column :items, :delivery_area_id, :string

    drop_table :items_statuses

    remove_column :brands, :item, :integer
  end
end
