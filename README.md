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
|birth_year        |integer|null: false             |
|birth_month       |integer|null: false             |
|birth_day         |integer|null: false             |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

|Column      |Type      |Option           |
|------------|----------|-----------------|
|name        |string    |null: false      |
|price       |integer   |null: false      |
|description |text      |null: false      |
|user        |references|foreign_key: true|
|category    |string    |null: false      |
|condition   |string    |null: false      |
|burden      |string    |null: false      |
|region      |string    |null: false      |
|day         |string    |null: false      |

### Association
- has_one :purchase
- belongs_to :user

## purchasesテーブル

|Column       |Type      |Option                 |
|-------------|----------|-----------------------|
|purchase_name|string    |                       |
|purchase_item|string    |                       |
|user         |references|foreign_key: true      |
|item         |references|foreign_key: true      |

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
|purchase    |references|foreign_key: true|

### Association

- belongs_to :purchase