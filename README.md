# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# freemarket_sample_67d DB設計
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|varchar(30)|null: false|
|email|string|null: false|
|last_name|varchar(50)|null: false|
|first_name|varchar(50)|null: false|
|last_name_kana|varchar(50)|null: false|
|first_name_kana|varchar(50)|null: false|
|address|string|null: false|
|phone_number|integer(32)|null: false|
|password|string|null: false|
|reset_password_token|string|null: false|
|reset_password_sent_at|datetime|null: false|
|remember_created_at|datetime|null: false|
|self_introduction|text||
|sales|integer||
|point|integer||
|icon|text||
## association
has_many :items
has_many :comments
has_many :likes
has_many :items_statuses
has_one :credit_card
has_many :addresses
accepts_nested_attributes_for :addresses
## add_index
add_index :email, unique: true
add_index :nickname, unique: true
add_index :phone_number, unique: true
add_index :password, unique: true
add_index :reset_password_token, unique: true
### 名前には制限をつけました

## Itemsテーブル
|Column|Type|Options|
|---------|------|---------|
|user_id|references|null: false|foreign_key: true｜
|item_name|string(50)|null: false|
|price|integer|null: false|
|category|string|null: false|
|status|string|null: false|
|size|string||
|delivery_fee|string|null: false|
|delivery_method|string|null: false|
|delivery_area|string|null: false|
|estimated_delivery|datetime|null: false|
## association
- has_many :item_comments
- has_many :likes
- has_many :items_statuses
- has_many :item_images
- has_many :brands
- belong_to :user
- belong_to :categroy
​
## Items_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
|item_comment|text|null: false|
### Association
- belongs_to :item
- belongs_to :user
## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
|like|integer|
### Association
- belongs_to :item
- belongs_to :user

## Items_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
|status|string|null: false|
### Association
- belongs_to :item
- belongs_to :user

## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|　←referencesつけたら_id必要なし？
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|building|string|null: false|
### Association
- belongs_to :user

## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|costomer_id|integer|null: false|
|card_id|integer|null: false|
### Association
- belongs_to :user

# Evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|text|null: false|
|user|integer|null :false, foreign_key: true|
### Association
- belongs_to :user

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null :false|
|ancestry|string|null :false|
|item|references|null: false,foreign_key: true|
### Association
- has_many :items
- has_ancestry

## Item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|item|integer|null :false, foreign_key|
### Association
- belong_to :item

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|item|integer|null :false, foreign_key|
# add_index
- add_index :brands, :name
### Association
- belongs_to :item