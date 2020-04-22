# DB

## usersテーブル（アカウント）

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false, unique:true|

### Association
- has_one :profile, dependent: :delete
- has_one :user_ information, dependent: :delete
- has_one :delivery_ information, dependent: :delete
- has_one :credit, dependent: :delete
- has_many :items, dependent: :delete_all
- has_many :reviews, dependent: :delete_all
- has_many :posts, dependent: :delete_all
- has_many :sold_lists, dependent: :delete_all
- has_many :buy_trading_lists, dependent: :delete_all
- has_many :bought_lists, dependent: :delete_all


## profilesテーブル（プロフィール）

|Column|Type|Options|
|------|----|-------|
|introduction|text|-------|
|image|string|-------|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## user_ informationsテーブル（本人情報）

|Column|Type|Options|
|------|----|-------|
|family_name|string|nul:false|
|first_name|string|nul:false|
|family_name_kana|string|nul:false|
|birth|date|nul:false|
|postal_code|integer|-------|
|state|string|-------|
|city|string|-------|
|address_line_1|string|-------|
|address_line_2|string|-------|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## delivery_ informationsテーブル（配送情報）

|Column|Type|Options|
|------|----|-------|
|family_name|string|nul:false|
|first_name|string|nul:false|
|family_name_kana|string|nul:false|
|postal_code|integer|nul:false|
|state|string|nul:false|
|city|string|nul:false|
|address_line_1|string|nul:false|
|address_line_2|string|nul:false|
|tel|string|nul:false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## creditsテーブル（カード情報）

|Column|Type|Options|
|------|----|-------|
|card_num|integer|nul:false|
|expiration|date|nul:false|
|security_code|integer|nul:false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## reviewsテーブル（いいね）

|Column|Type|Options|
|------|----|-------|
|assessment|string|null: false|
|comment|text|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## itemsテーブル（商品）

|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|description|text|nul:false|
|sales_status|integer|null: false|
|brand|string|-------|
|size|string|nul:false|
|condition|string|nul:false|
|price|integer|nul:false|
|shipping_area|string|nul:false|
|arrival_days|string|nul:false|
|postage_payment|string|nul:false|
|items_image_id|integer|nul:false, foreign_key: true|
|category_id|integer|nul:false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_one :review, dependent: :delete
- has_many :item_images, dependent: :delete_all
- belongs_to :user
- belongs_to :item_category

## item_imagesテーブル（商品画像）

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null:false|

### Association
- belongs_to :items

## items_categoriesテーブル（中間テーブル）

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false|
|categories_id|integer|null:false|

### Association
- has_many :items
- has_many :categories

## categoriesテーブル（カテゴリー）

|Column|Type|Options|
|------|----|-------|
|name|string|-------|

### Association
- belongs_to :items_category

## postsテーブル（出品）

|Column|Type|Options|
|------|----|-------|
|posts_status|integer|-------|
|user_id|integer|nul:false, foreign_key: true|
|item_id|integer|nul:false, foreign_key: true|

### Association
- has_one :item, dependent: :delete
- belongs_to :items_category

## cartsテーブル（カート）

|Column|Type|Options|
|------|----|-------|
|carts_status|integer|-------|
|user_id|integer|nul:false, foreign_key: true|
|item_id|integer|nul:false, foreign_key: true|

### Association
- has_one :item
- belongs_to :items_category