# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| full_name          | string | null: false               |
| kana_name          | string | null: false               |
| date_of_birth      | date   | null: false               |

### Association

-has_many :items
-has_many :purchases

## itemsテーブル

| Column                  | Type       | Options                        |
|-------------------------|------------|--------------------------------|
| name                    | string     | null: false                    |
| description             | text       | null: false                    |
| category_id             | integer    | null: false                    |
| condition_id            | integer    | null: false                    |
| shipping_fee_paid_by_id | integer    | null: false                    |
| origin_region_id        | integer    | null: false                    |
| shipping_day_id         | integer    | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :purchase

## purchasesテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :shipping_address

## shipping_addresses

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| purchase         | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| origin_region_id | integer    | null: false                    |
| city             | string     | null: false                    |
| street_number    | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |

### Association

-belongs_to :purchase