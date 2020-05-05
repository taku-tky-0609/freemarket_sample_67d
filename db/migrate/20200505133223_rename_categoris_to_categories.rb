class RenameCategorisToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_table :categoris, :categories
  end
end
