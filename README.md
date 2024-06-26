# テーブル設計

## users table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases


## items table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| item_description   | text   | null: false |
| category           | integer | null: false, default: 0 |
| condition          | integer | null: false, default: 0 |
| shipping_cost      | integer | null: false, default: 0 |
| sender_address     | integer | null: false, default: 0 |
| days_to_ship       | integer | null: false, default: 0 |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true |

### Association

belongs_to :user
has_one :purchase

## orders table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture         | integer | null: false, default: 0 |
| municipality       | string | null: false |
| house_address      | string | null: false |
| building_name      | string |             |
| phone_number       | string | null: false |
| purchase           | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## purchases table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :order