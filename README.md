# README

## usersテーブル

|Column            |Type   |Option                  |
|------------------|-------|------------------------|
|nickname          |string |null: false             |
|email             |string |null: false unique: true|
|encrypted_password|string |null: false             |
|last_name         |string |null: false             |
|first_name        |string |null: false             |
|last_name_kana    |string |null: false             |
|first_name_kana   |string |null: false             |
|birthday_id       |date   |null: false             |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

|Column         |Type      |Option           |
|---------------|----------|-----------------|
|name           |string    |null: false      |
|price          |integer   |null: false      |
|description    |text      |null: false      |
|user           |references|foreign_key: true|
|category_id    |integer   |null: false      |
|condition_id   |integer   |null: false      |
|burden_id      |integer   |null: false      |
|region_id      |integer   |null: false      |
|day_id         |integer   |null: false      |

### Association
- has_one :purchase
- belongs_to :user

## purchasesテーブル

|Column       |Type      |Option                 |
|-------------|----------|-----------------------|
|user         |references|foreign_key: true      |
|item         |references|foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

|Column       |Type      |Option           |
|-------------|----------|-----------------|
|postcode     |string    |null: false      |
|region_id    |integer   |null: false      |
|city_name    |string    |null: false      |
|house_number |string    |null: false      |
|building     |string    |                 |
|phone_number |string    |null: false      |
|purchase     |references|foreign_key: true|

### Association

- belongs_to :purchase