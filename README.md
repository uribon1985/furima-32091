# README

## users テーブル

|  Column               | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | uniqueness: true |
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

| Column                | Type      | Options     |
| ------                | ------    | ----------- |
| name                  | string    | null:false  | 
| category_id           | integer   | null:false  |
| product_condition_id  | integer   | null:false  |
| shipping_charges_id   | integer   | null:false  | 
| shipping_area_id      | integer   | null:false  |
| estimated_shipping_id | integer   | null:false  |
| product_description   | text      | null:false  |
| price                 | integer   | null:false  |
| user                  | references | null: false, foreign_key: true｜


### Association
- has_one :order
- belongs_to :user


## orders テーブル

| Column    | Type       | Options                        |
| --------  | ------     | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressテーブル

| Column             | Type       | Options     |
| ---------------    | ------     | ----------- |
| postal_code        | string     | null:false  |
| shipping_area_id   | integer    | null:false  |
| municipality       | string     | null:false  |
| address            | string     | null:false  |
| building_name      | string     |
| phone number       | string     | null:false  |
| order              | references | null:false, foreign_key: true |


### Association
- belongs_to :order