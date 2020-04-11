# freemarket_sample_67d DB設計
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|  
|email|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|address|string|null: false|　←　いる？
|phone_number|integer|null: false|
|password|string|null: false|
|reset_password_token|string|null: false|　←　なんだっけ？
|reset_password_sent_at|datetime|null: false|
|remember_created_at|datetime|null: false|
|self_introduction|text||
|sales|integer||
|point|integer||
|icon|text||
### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :items_statuses
- has_one :credit_card
- has_many :addresses
- accepts_nested_attributes_for :addresses
### add_index
- add_index :email, unique: true
- add_index :nickname, unique: true
- add_index :phone_number, unique: true
- add_index :password, unique: true
- add_index :reset_password_token, unique: true
### 名前には制限をつけました

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item_name|string|null: false|
|price|integer|null: false|
|category|references|null: false|
|status|string|null: false|
|size|string||
|delivery_fee|string|null: false|
|delivery_method|string|null: false|
|delivery_area|string|null: false|
|estimated_delivery|datetime|null: false|
### Association
- has_many :item_comments
- has_many :likes
- has_many :items_statuses
- has_many :item_images
- belong_to :brand
- belong_to :user
- belong_to :categroy
accepts_nested_attributes_for :item_images

## Items_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item|references|null: false|
|item_comment|text|null: false|
### Association
- belongs_to :item
- belongs_to :user
## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false| 
|item|references|null: false|
### Association
- belongs_to :item
- belongs_to :user

## Items_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|item|references|null: false|
|status|string|null: false|
### Association
- belongs_to :item
- belongs_to :user

## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|building|string|null: false|
### Association
- belongs_to :user

## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|costomer_id|integer|null: false|
|card_id|integer|null: false|
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
|category_name|string|null :false|
|ancestry|string|null :false|
### Association
- has_many :items
- has_ancestry

## Item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|item|integer|null :false|
### Association
- belong_to :item

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|item|integer|null :false|
|name|string|null :false|
### Association
- has_many :items
### add_index
- add_index :name

