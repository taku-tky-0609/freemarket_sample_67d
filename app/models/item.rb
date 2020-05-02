class Item < ApplicationRecord
  # has_many :item_comments
  # has_many :likes
  # has_many :items_statuses
  has_many :item_images
  
  # belongs_to :brand
  belongs_to :user
  belongs_to :categori
  accepts_nested_attributes_for :item_images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :estimated_delivery
  belongs_to_active_hash :status
end
