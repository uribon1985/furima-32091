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
| birthday              | date   | null: false |

### Association
   
- has_many  :orders
- has_many  :items


## items テーブル

| Column             | Type      | Options     |
| ------             | ------    | ----------- |
| sell               | string    | null:false  | 
| category           | integer   | null:false  |
| product_condition  | integer   | null:false  |
| shipping_charges   | integer   | null:false  | 
| shipping_area      | integer   | null:false  |
| estimated_shipping | integer   | null:false  |
| product_description| integer   | null:false  |
| price              | integer   | null:false  |
| user               | reference | null: false, foreign_key: true｜


### Association
- has_one :order
- belongs_to :user


## orders テーブル

| Column    | Type      | Options                        |
| --------  | ------    | ------------------------------ |
| user      | reference | null: false, foreign_key: true |
| itmes     | reference | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressテーブル

| Column          | Type      | Options     |
| --------------- | ------    | ----------- |
| postal_code     | string    | null:false  |
| prefecture_id   | integer   | null:false  |
| municipality    | string    | null:false  |
| address         | string    | null:false  |
| building_name   | string    |
| phone number    | string    | null:false  |
| user            | reference | null: false, foreign_key: true |
| itmes           | reference | null: false, foreign_key: true |



### Association
- belongs_to :order