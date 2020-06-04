# freemarket_sample_67d DB設計
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|phone_number|string|null: false|
|self_introduction|text||
|sales|integer||
|point|integer||
|icon|text||
|birthday|date||
|email|string|default: "", null: false|
|encrypted_password|string||
|reset_password_token|string|null: false|
|reset_password_sent_at|datetime|null: false|
|remember_created_at|datetime|null: false|
|address_id|bigint||
### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :items_statuses
- has_one :credit
- one :address
- accepts_nested_attributes_for :address
### add_index
- add_index :address_id
- add_index :email
- add_index :reset_password_token


## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|item_name|string|null: false|
|price|integer|null: false|
|category_id|bigint|null: false|
|status_id|integer|null: false|
|size|string||
|delivery_method_id|integer|null: false|
|delivery_fee_id|integer|null: false|
|estimated_delivery_id|integer|null: false|
|brind_id|bigint||
|prefecture_id|integer||
|buyer_id|bigint||
### Association
- has_many :item_comments
- has_many :likes
- has_many :items_statuses
- has_many :item_images
- accepts_nested_attributes_for :item_images, allow_destroy: true, update_only: true
- accepts_nested_attributes_for :brand
- belong_to :brand, optional: true
- belong_to :user
- belong_to :categroy
- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :delivery_method
- belongs_to_active_hash :estimated_delivery
- belongs_to_active_hash :status
### add_index
- add_index :user_id
- add_index :category_id
- add_index :brand_id

## Items_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false|
|item_id|bigint|null: false|
|item_comment|text|null: false|
### Association
- belongs_to :item
- belongs_to :user
### add_index
- add_index :user_id
- add_index :item_id

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false| 
|item_id|bigint|null: false|
### Association
- belongs_to :item
- belongs_to :user
### add_index
- add_index :user_id
- add_index :item_id

## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|postal_code|string|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|building|string||
|house_number|string|null: false|
### Association
- belongs_to :user, optional: ture
### add_index
- add_index :user

## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|costomer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

# Evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|null :false|
|evaluation|text|null: false|
### Association
- belongs_to :user

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|ancestry|string||
### Association
- has_many :items
- has_ancestry
- has_many :item_images
- accepts_nested_attributes_for :item_images, allow_destroy: true, update_only: true

## Item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null:false|
|item_id|integer|null :false|
### Association
- mount_uploader :src, ImageUploader
- belong_to :item

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|

### Association
- has_many :items


