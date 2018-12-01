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
|address|text|null: false|
|telephone|string|null: false|
|birthday|date|null: false|
|password|string|null: false|
|self_introduction|text|null: false|


### Association
- has_many :sales, dependent: :destroy
- has_many :points, dependent: :destroy
- has_many :reviews,dependent: :destroy
- has_many :notifications, as: :notificationable, dependent: :destroy
- has_many :todos, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :purchases, dependent: :destroy
- has_many :sells, dependent: :destroy

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true,null: false, unique: true|
|image|string|null: false|
|content|text|null: false|
|condition|text|null: false|
|size|string|null: false|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|price|string|null: false|
|commision|string|null: false|
|shipping_options|string|null: false|
|shipping_date|date|null: false|
|shipping_area|string|null: false|
|shipping_fee|string|null: false|


### Association
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- belongs_to :category
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

## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## sellsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## salesテーブル

|Column|Type|Options|
|------|----|-------|
|sale|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## freemarket_pointsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|freemarket_point|string|null: false|

### Association
- belongs_to :user

## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|review|string|null: false|

### Association
- belongs_to :user

## notificationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|title|string|null: false|
|content|text|null: false|
|notificationable_id|string|null: false|

### Association
- belongs_to :user
- belongs_to :notificationable, polymorphic: true

## todosテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|title|string|null: false|
|content|text|null: false|

### Association
- belongs_to :user

## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true,null: false, unique: true|

### Association
- has_many :items, dependent: :destroy

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true,null: false, unique: true|

### Association
- has_many :items, dependent: :destroy

