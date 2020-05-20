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
|user_id|refernces|null: false, foreign_key: true|

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
|user_id|refernces|null: false, foreign_key: true|

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
|user_id|refernces|null: false, foreign_key: true|

### Association
- belongs_to :user

## creditsテーブル（カード情報）

|Column|Type|Options|
|------|----|-------|
|customer_id|string|nul:false|
|card_id|string|nul:false|
|user_id|refernces|null: false, foreign_key: true|

### Association
- belongs_to :user

## reviewsテーブル（いいね）

|Column|Type|Options|
|------|----|-------|
|assessment|string|null: false|
|comment|text|-------|
|user_id|refernces|null: false, foreign_key: true|
|item_id|refernces|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## postsテーブル（出品）

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
|sellar_name|string|nul:false|
|buyer_name|string|nul:false|
|posts_status|integer|nul:false|
|items_image_id|refernces|nul:false, foreign_key: true|
|category_id|refernces|nul:false, foreign_key: true|
|user_id|refernces|null: false, foreign_key: true|

### Association
- has_one :review, dependent: :delete
- has_many :item_images, dependent: :delete_all
- has_many :categories
- belongs_to :user

## item_imagesテーブル（商品画像）

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null:false|

### Association
- belongs_to :item

## categoriesテーブル（カテゴリー）

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
|ancestry|string|null: false|

### Association
- belongs_to :post
- has_ancestry

## cartsテーブル（カート）

|Column|Type|Options|
|------|----|-------|
|carts_status|integer|-------|
|user_id|refernces|nul:false, foreign_key: true|
|post_id|refernces|nul:false, foreign_key: true|

### Association
- has_one :posts
- belongs_to :user