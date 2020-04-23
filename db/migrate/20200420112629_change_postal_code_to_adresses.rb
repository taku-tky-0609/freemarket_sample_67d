class ChangePostalCodeToAdresses < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :postal_code, :string
  end

  def down
    change_column :addresses, :postal_code, :integer
  end
end

