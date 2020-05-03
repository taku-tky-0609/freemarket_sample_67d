class CreateCategoris < ActiveRecord::Migration[5.2]
  def change
    create_table :categoris do |t|
      t.string :category_name, null: false
      t.string :ancestry, null: false
      t.timestamps
    end
  end
end




  