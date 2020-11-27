# README

## users テーブル

|  Column               | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| first_name            | string | null: false |
| first_name_kana       | string | null: false |
| last_name             | string | null: false |
| last_name_kana        | string | null: false |
| birth_year            | date   | null: false |
| birth_mouth           | date   | null: false |
| birth_day             | date   | null: false |

### Association

- has_many  :orders
- has_many  :items


## items テーブル

| Column             | Type    | Options     |
| ------             | ------  | ----------- |
| sell               | string  | null:false  | 
| category           | integer | null:false  |
| product_condition  | integer | null:false  |
| shipping_charges   | integer | null:false  | 
| shipping_area      | integer | null:false  |
| estimated_shipping | integer | null:false  |

### Association
- has_one :orders
- belongs_to :user


## orders テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nick name | string | null:false  |
| category  | string | null:false  |

### Association
- has_one :items
- has_many :address
- belongs_to :user


## addressテーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| postal_code     | string  | null:false  |
| prefecture_id   | integer | null:false  |
| municipality    | string  | null:false  |
| address         | string  | null:false  |
| building_name   | text    |
| phone number    | string  | null:false  |


### Association
- belongs_to :order