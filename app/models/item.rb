class Item < ApplicationRecord
  belongs_to :brand
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

  validates :item_name, presence: true
  validates :price, presence: true
  validates :status_id, presence: true
  validates :delivery_method_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :estimated_delivery_id, presence: true
  validates :category_id, presence: true
end
