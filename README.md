# README

# DB設計


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|nickname|string|null: false, unique: true|
|mail|string|null: false|
|telephone|string|null: false, unique: true|
|postal_code|integer|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|banchi|string|null: false|
|building|integer|---|
|birthday|date|null: false|
|password|string|null: false|
|avatar|string|null: false|
|self_introduction|text|null: false|

### Association
- has_one :credit_cards, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :items_of_buyer, through: :transaction_of_buyer, source: "item"
- has_many :items_of_seller,through: :transaction_of_seller, source: "item"
- has_many :transaction_of_buyer, class_name: "Transaction", foreign_key: :buyer_id
- has_many :transaction_of_seller, class_name: "Transaction", foreign_key: :seller_id

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_no|integer|null: false, unique: true|
|expire_mm|integer|null: false|
|expire_yy|integer|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|index: true,null: false, unique: true|
|content|text|null: false|
|condition|text|null: false|
|size|string|null: false|
|brand_id|references|null: false, foreign_key: true|
|price|string|null: false|
|shipping_options|string|null: false|
|shipping_date|date|null: false|
|shipping_area|string|null: false|
|shipping_fee|string|null: false|

### Association
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :transactions, dependent: :destroy
- has_many :sellers, through: :transactions
- has_many :buyers, through: :transactions
- has_many :images, dependent: :destroy
- has_many :categorys,through: :category_groups
- belongs_to :brand
- belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true,null: false, unique: true|
|parent_id|integer|---|

### Association
- has_many :items, through: :category_groups
- has_many :category_groups

## category_groupsテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true,null: false, unique: true|

### Association
- has_many :items, dependent: :destroy

## transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|status|string|null: false|

### Association
- belongs_to :item
- belongs_to :user
- belongs_to :buyer, class_name: "User"
- belongs_to :seller, class_name: "User"

