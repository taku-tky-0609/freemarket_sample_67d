# freemarket_sample_67d DB設計

## Usersテーブル
|Column|Type|Options|
|------|----|-------| 
|nickname|varchar(30)|null: false|
|email|string|null: false|
|last name|varchar(50)|null: false|
|farst_name|varchar(50)|null: false|
|last_name_kana|varchar(50)|null: false|
|farst_name_kana|varchar(50)|null: false|
|address|string|null: false|
|phone_number|integer(32)|null: false|
|password|string|null: false|
|reset_password_token|string|null: false|
|reset_password_sent_at|datetime|null: false|
|remember_created_at|datetime|null: false|
|self_introduction|text|
|sales|integer||
|point|integer||
|icon|text||
## association
has_many :items
has_many :comments 
has_ many :goods
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

## itemsテーブル
|Column|Type|Options|
|---------|------|---------|
|id|references|null: false|
|item_name|string|null: false, limit:20|
|price|integer|null: false|
|category|string|null: false|
|status|string|null: false|
|size|string|null: false|
|delivery_fee|string|null: false| 
|delivery_method|string|null: false|
|delivery_area|string|null: false|
|estimated_delivery|datetime|null: false|
## association
- has_many :item_comments
- has_many :users, through: :item_comments
- has_many :goods
- has_many :users, through: :goods
- has_many :items_statuses
- has_many :users, through: :items_statuses
- has_many :main_categories

## items_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
|item_comment|text|null: false|
### Association
- belongs_to :item
- belongs_to :user

## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
|good|integer|
### Association
- belongs_to :item
- belongs_to :user

## items_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false|
|status|string|null: false|
### Association
- belongs_to :item
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key: true|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipality|string|null: false|
|building|string|null: false|
### Association
- belongs_to :user

## credit cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|costomer_id|integer|null: false|
|card_id|integer|null: false|
### Association
- belongs_to :user

# evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|text|null: false|
|user|integer|null :false, foreign_key: true|
### Association
- belongs_to :user

## main_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item|integer|null: false, foreign_key: true|
|name|string|null: false|
|main_category|integer|null:false, primary_key: true|  
### Association
- belongs_to :item
- has_many :secondary_categories
### categoryは商品テーブルの項目で記載されているのを仮定してます。

## secondary_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|main_category|integer|null: false, foreign_key: true|
|name|string|null: false|
|secondary_category|integer|null: false, primary_key|
### Association
- belongs_to :main_category
- has_many :third_categories

## third_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|secondary_category|integer|null: false, foreign_key: true|
|name|string|null: false|
|third_category|integer|null: false, primary_key|
### Association
- belongs_to :secondary_category

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_id|integer|null: false, primary_key|
|iamge|string|null:false|
|item|integer|null :false, foreign_key|
### Association
- belong_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|item|integer|null :false, foreign_key|
# add_index
- add_index :brands, :name
### Association
- belongs_to :item