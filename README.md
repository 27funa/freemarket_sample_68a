# DB

## usersテーブル（アカウント）

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false, unique:true|

### Association
- has_one :profiles, user_ informations, delivery_ informations, credits
- has_many :items, reviews, posts, sold_lists, buy_trading_lists, bought_lists

## profilesテーブル（プロフィール）

|Column|Type|Options|
|------|----|-------|
|email|string|-------|
|image|string|-------|

## user_ informationsテーブル（本人情報）

|Column|Type|Options|
|------|----|-------|
|family_name|string|nul:false|
|first_name|string|nul:false|
|family_name_kana|string|nul:false|
|birth|date|nul:false|
|postal code|integer|-------|
|state|string|-------|
|city|string|-------|
|address_line_1|string|-------|
|address_line_2|string|-------|

## delivery_ informationsテーブル（配送情報）

|Column|Type|Options|
|------|----|-------|
|family_name|string|nul:false|
|first_name|string|nul:false|
|family_name_kana|string|nul:false|
|postal code|integer|nul:false|
|state|string|nul:false|
|city|string|nul:false|
|address_line_1|string|nul:false|
|address_line_2|string|nul:false|
|tel|string|nul:false|
## delivery_ informationsテーブル（配送情報）

|Column|Type|Options|
|------|----|-------|
|family_name|string|nul:false|
|first_name|string|nul:false|
|family_name_kana|string|nul:false|
|postal code|integer|nul:false|
|state|string|nul:false|
|city|string|nul:false|
|address_line_1|string|nul:false|
|address_line_2|string|nul:false|
|tel|string|nul:false|
## delivery_ informationsテーブル（配送情報）

|Column|Type|Options|
|------|----|-------|
|family_name|string|nul:false|
|first_name|string|nul:false|
|family_name_kana|string|nul:false|
|postal code|integer|nul:false|
|state|string|nul:false|
|city|string|nul:false|
|address_line_1|string|nul:false|
|address_line_2|string|nul:false|
|tel|string|nul:false|

## creditsテーブル（カード情報）

|Column|Type|Options|
|------|----|-------|
|card_num|integer|nul:false|
|expiration|date|nul:false|
|security_code|integer|nul:false|

## reviewsテーブル（いいね）

|Column|Type|Options|
|------|----|-------|
|assessment|string|null: false|
|comment|text|-------|
|users_id|integer|null: false, foreign_key: true|
|items_id|integer|null: false, foreign_key: true|

### Association
- has_one :items
- belongs_to :users

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
|users_id|integer|nul:false, foreign_key: true|
|items_images_id|integer|nul:false, foreign_key: true|
|categories_id|integer|nul:false, foreign_key: true|

### Association
- has_many :item_images
- belongs_to :users, item_categories

## items_imagesテーブル（商品画像）

|Column|Type|Options|
|------|----|-------|
|image_1|string|null: false|
|image_2|string|-------|
|image_3|string|-------|
|image_4|string|-------|
|image_5|string|-------|
|image_6|string|-------|
|items_id|integer|null:false|

### Association
- belongs_to :items

## items_categoriesテーブル（中間テーブル）

|Column|Type|Options|
|------|----|-------|
|items_id|integer|null: false|
|categories_id|integer|null:false|

### Association
- has_many :items, categories

## categoriesテーブル（カテゴリー）

|Column|Type|Options|
|------|----|-------|
|mens|string|-------|
|ladies|string|-------|
|kids|string|-------|

### Association
- belongs_to :items_categories

## postsテーブル（出品）

|Column|Type|Options|
|------|----|-------|
|posts_status|integer|-------|
|users_id|integer|nul:false, foreign_key: true|
|items_id|integer|nul:false, foreign_key: true|

### Association
- has_one :items
- belongs_to :items_categories

## cartsテーブル（カート）

|Column|Type|Options|
|------|----|-------|
|carts_status|integer|-------|
|users_id|integer|nul:false, foreign_key: true|
|items_id|integer|nul:false, foreign_key: true|

### Association
- has_one :items
- belongs_to :items_categories