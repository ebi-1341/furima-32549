# README

## usersテーブル

|Column           |Type  |Option      |
|-----------------|------|------------|
|nickname         |string|null: false |
|email            |string|            |
|password         |string|            |
|last_name        |string|null: false |
|first_name       |string|null: false |
|last_name_kana   |string|null: false |
|first_name_kana  |string|null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

|Column      |Type      |Option           |
|------------|----------|-----------------|
|name        |string    |null: false      |
|price       |integer   |null: false      |
|description |text      |null: false      |
|exhibit_name|string    |                 |
|user_id     |references|foreign_key: true|

### Association
- has_one :purchase
- belongs_to :user

## purchasesテーブル

|Column       |Type      |Option                 |
|-------------|----------|-----------------------|
|purchase_name|string    |                       |
|purchase_item|string    |                       |
|user_id      |references|foreign_key: true      |
|item_id      |references|foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

|Column      |Type      |Option           |
|------------|----------|-----------------|
|postcode    |string    |null: false      |
|city_name   |string    |null: false      |
|house_number|string    |null: false      |
|building    |string    |                 |
|phone_number|string    |null: false      |
|purchase_id |references|foreign_key: true|

### Association

- belongs_to :purchase