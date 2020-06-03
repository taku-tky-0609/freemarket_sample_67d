class Item < ApplicationRecord
  belongs_to :brand, optional:true
  belongs_to :user
  belongs_to :category
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true, update_only: true
  accepts_nested_attributes_for :brand
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :estimated_delivery
  belongs_to_active_hash :status

  validates_with MyValidator
  validates :item_name, :price, :status_id, :delivery_method_id, :delivery_fee_id, :prefecture_id, :estimated_delivery_id, :category_id, :item_images, presence: true
end
