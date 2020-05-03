class DropItemImages < ActiveRecord::Migration[5.2]
  def up
    drop_table :item_images
  end

  def down
    create_table :item_images do |t|
      t.string :image, null: false
      t.integer :item, null: false
      t.timestamps
    end  
  end
end
