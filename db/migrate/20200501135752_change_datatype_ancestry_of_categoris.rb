class ChangeDatatypeAncestryOfCategoris < ActiveRecord::Migration[5.2]
  def change
    remove_column :categoris, :ancestry, :string
    add_column :categoris, :ancestry, :string
  end
end
