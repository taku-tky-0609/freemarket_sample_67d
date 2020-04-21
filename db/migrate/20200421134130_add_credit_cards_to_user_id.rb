class AddCreditCardsToUserId < ActiveRecord::Migration[5.2]
  def up
    add_column :credit_cards, :user_id, :integer
    change_column :credit_cards, :user_id, :integer, :null => false
    add_column :credit_cards, :customer_id, :string
    change_column :credit_cards, :customer_id, :string, :null => false
    add_column :credit_cards, :card_id, :string
    change_column :credit_cards, :card_id, :string, :null => false
  end
  def down
    remone_column :credit_cards, :user_id
    remone_column :credit_cards, :customer_id
    remone_column :credit_cards, :card_id
  end
end
