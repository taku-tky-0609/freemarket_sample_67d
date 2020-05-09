class Item < ApplicationRecord
  # has_many :item_comments
  # has_many :likes
  # has_many :items_statuses
  # has_many :item_images
  
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  # accepts_nested_attributes_for :item_images
  has_many_attached :images
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
