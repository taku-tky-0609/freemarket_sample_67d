class RenameDeliveriesColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :status, :status_id
    rename_column :items, :delivery_method, :delivery_method_id
    rename_column :items, :delivery_fee, :delivery_fee_id
    rename_column :items, :delivery_area, :delivery_area_id
    rename_column :items, :estimated_delivery, :estimated_delivery_id
  end
end
