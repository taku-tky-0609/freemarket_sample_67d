class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, null: false
      t.string :item_name, null: false
      t.integer :price, null: false
      t.references :category, null: false
      t.string :status, null: false
      t.string :size, null: false
      t.string :delivery_method
      t.string :delivery_fee, null: false
      t.string :delivery_area, null: false
      t.datetime :estimated_delivery, null: false
      t.timestamps
    end
  end
end



