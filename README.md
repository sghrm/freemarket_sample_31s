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

# DB設計


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false, unique: true|
|first_name|string|null: false, unique: true|
|family_name_kana|string|null: false, unique: true|
|first_name_kana|string|null: false, unique: true|
|nickname|string|null: false, unique: true|
|mail|string|null: false|
|telephone|string|null: false|
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
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :transactions, dependent: :destroy
- has_many :buyer, class_name: "Transaction"

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
- has_many :images, dependent: :destroy
- has_many :categorys,through,category_croups
- belongs_to :brand

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
- has_many :items, through: :category_groups
- has_many :category_groups

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
|status|string|null: false|

### Association
- belongs_to :item
- belongs_to :user
- belongs_to :buyer, class_name: "User"

