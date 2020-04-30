class ChangeDataDeliveriesToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :status_id, :integer
    change_column :items, :delivery_method_id, :integer
    change_column :items, :delivery_fee_id, :integer
    change_column :items, :delivery_area_id, :integer
    change_column :items, :estimated_delivery_id, :integer
  end
end
