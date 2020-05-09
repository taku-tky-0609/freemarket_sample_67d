class DropItemStatus < ActiveRecord::Migration[5.2]
  def change
    drop_table :items_statuses
  end
end
