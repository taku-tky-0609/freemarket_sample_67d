class Brand < ApplicationRecord
  - add_index :name
  - has_many :items
end
