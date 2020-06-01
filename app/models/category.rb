class Category < ApplicationRecord
  has_many :items
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true, update_only: true

  has_ancestry
  
end
