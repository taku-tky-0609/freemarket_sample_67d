class ChangeDatatypebirthdayOfusers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :birthday, :data, false
  end
end
