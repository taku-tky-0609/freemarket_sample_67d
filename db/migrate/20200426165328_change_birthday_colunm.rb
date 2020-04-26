class ChangeBirthdayColunm < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :birthday, :date
  end

  def down
    change_column :users, :birthday, :string, null: false
  end
end
