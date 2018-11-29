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
|mail|string|null: false|
|telephone|string|null: false|
|birthday|string|null: false|
|password|string|null: false|
|self_introduction|text|null: false|


### Association
- has_many :sales
- has_many :points
- has_many :reviews
- has_many :notifications, as: :notificationable
- has_many :todos
- has_many :comments
- has_many :likes
- has_many :purchases
- has_many :sells

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|index: true,null: false, unique: true|
|image|string|null: false|
|item_content|text|null: false|
|condition|text|null: false|
|size|string|null: false|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|price|string|null: false|
|commision|string|null: false|
|shipping_options|string|null: false|
|shipping_date|string|null: false|
|shipping_area|string|null: false|
|shipping_fee|string|null: false|


### Association
- has_many :comments
- has_many :likes
- belongs_to :category
- belongs_to :brand

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment_content|text|null: false|
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

### Association
- belongs_to :user

## freemarket_pointsテーブル

|Column|Type|Options|
|------|----|-------|
|freemarket_point|string|null: false|

### Association
- belongs_to :user

## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|review|string|null: false|

### Association
- belongs_to :user

## notificationsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|null: false|
|notificationable_id|string|null: false|

### Association
- belongs_to :user
- belongs_to :notificationable, polymorphic: true

## todosテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text|null: false|

### Association
- belongs_to :user

