# README

## users テーブル

|  Column               | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| name(full-width)      | string | null: false |
| name.kana(full-width) | string | null: false |
| birth_year            | data   | null: false |
| birth_mouth           | data   | null: false |
| birth_day             | data   | null: false |

### Association

- has_many  :order
- has_many  :items


## items テーブル

| Column             | Type   | Options     |
| ------             | ------ | ----------- |
| sell               | string | null:false  | 
| category           | string | null:false  |
| product condition  | string | null:false  |
| shipping charges   | string | null:false  | 
| shipping area      | string | null:false  |
| estimated shipping | date   | null:false  |

### Association

- belongs_to :user


## order テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nick name | string | null:false  |
| category  | string | null:false  |

### Association

- has_many :address
- belongs_to :user


## addressテーブル

| Column        | Type    | Options     |
| --------      | ------  | ----------- |
| postal code   | integer | null:false  |
| prefectures   | text    | null:false  |
| municipality  | text    | null:false  |
| address       | integer | null:false  |
| building name | text    | null:false  |
| phone number  | integre | null:false  |


### Association
- belongs_to :order