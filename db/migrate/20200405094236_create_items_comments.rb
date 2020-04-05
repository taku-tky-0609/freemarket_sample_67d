class CreateItemsComments < ActiveRecord::Migration[5.2]
  def change
    create_table :items_comments do |t|
      t.references :user, null: false
      t.references :item, null: false
      t.text :item_comment, null: false
      t.timestamps
    end
  end
end



