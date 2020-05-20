# freemarket_sample_67d DB設計
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|  
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|phone_number|string|null: false|
|self_introduction|text||
|sales|integer||
|point|integer||
|icon|text||
|birthday|date|null: false|
|email|string|null: false, index: ture|
|password|string|null: false|
|reset_password_token|string|null: false,|　←　なんだっけ？
|reset_password_sent_at|datetime|null: false|
|remember_created_at|datetime|null: false|
|created_at|datetime|null:false|
|updated_at|datetime|null:false|
|address_id|bigint|index:true|

### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :items_statuses
- has_one :credit
- has_one :addresses
- accepts_nested_attributes_for :addresses

### add_index
- add_index :email, unique: true
- add_index :reset_password_token, unique: true
- add_index :address_id

### add_foreign_key
- add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
- add_foreign_key "items", "brands"
- add_foreign_key "users", "addresses"



## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item_name|string|null: false|
|price|integer|null: false|
|category_id|references|null: false|
|status_id|integer|null: false|
|size|string|null: false|
|delivery_method_id|integer|null: false|
|delivery_fee_id|integer|null: false|
|estimated_delivery_id|integer|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: fasle|
|brand_id|bigint||
|prefecture_id|integer||
|buyer_id|bigint||

### add_index
- add_index :brand_id
- add_index :category_id
- add_index :user_id

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many_attached :images
- accepts_nested_attributes_for :brand
- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :delivery_method
- belongs_to_active_hash :estimated_delivery
- belongs_to_active_hash :status

## Items_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item|references|null: false|
|item_comment|text|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: fasle|

### add_index
- add_index :item_id
- add_index :user_id

### Association
- belongs_to :user


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false| 
|item|references|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: fasle|

### add_index
- add_index :item_id
- add_index :user_id

### Association
- belongs_to :user

<!-- ## Items_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item|references|null: false|
|status|string|null: false|
### Association
- belongs_to :item
- belongs_to :user -->

## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|postal_code|string|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|building|string||
|house_number|string|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: fasle|

### add_index
- add_index :user_id

### Association
- belongs_to :user, optional: true

## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|costomer_id|string|null: false|
|card_id|string|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: fasle|

### Association
- belongs_to :user

# Evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|null :false|
|evaluation|text|null: false|
|created_at|datetime|null: false|
|updated_at|datetime|null: fasle|

### Association
- belongs_to :user

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|created_at|datetime|null: false|
|updated_at|datetime|null: fasle|
|ancestry|string||

### Association
- has_many :items
- has_ancestry

<!-- ## Item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|item|integer|null :false|
### Association
- belong_to :item -->

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|created_at|datetime|null: false|
|updated_at|datetime|null: fasle|

### Association
- has_many :items

### add_index
- add_index :name

## Active_storage_attachmentsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|record_type|string|null: false|
|record_id|bigint|null: false|
|blob_id|bigint|null: false|
|created_at|datetime|null: false|

### add_index
- add_index :blob_id
- add_index :record_type

## Active_storage_blobsテーブル
|Column|Type|Options|
|------|----|-------|
|key|string|null: false|
|filename|string|null: false|
|content_type|string|null: false|
|metadata|text||
|byte-size|bigint|null: false|
|checksum|string|null: false|
|created_at|datetime|null: false|

### add_index
- add_index :key




