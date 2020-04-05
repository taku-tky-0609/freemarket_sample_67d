class Item < ApplicationRecord
  - has_many :item_comments
  - has_many :likes
  - has_many :items_statuses
  - has_many :item_images
  
  - belong_to :brand
  - belong_to :user
  - belong_to :categroy
  accepts_nested_attributes_for :item_images

end
