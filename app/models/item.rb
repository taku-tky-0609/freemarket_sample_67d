class Item < ApplicationRecord
  has_many :item_comments
  has_many :likes
  has_many :items_statuses
  has_many :item_images
  
  belongs_to :brand
  belongs_to :user
  belongs_to :categroy
  accepts_nested_attributes_for :item_images
  belongs_to_active_hash :prefecture, :delivery_fee, :delivery_method, :estimated_delivery
end
