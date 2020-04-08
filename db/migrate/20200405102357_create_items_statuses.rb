class CreateItemsStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :items_statuses do |t|
      t.references :user, null: false
      t.references :item, null: false
      t.string :status, null: false


      t.timestamps
    end
  end
end


