# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| last_name         | string | null: false               |
| first_name          | string | null: false               |
| last_name_kana    | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items, dependent: :destroy
- has_many :orders
- has_one :address, dependent: :destroy


## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| item_info            | text       | null: false                    |
| item_price           | integer    | null: false                    |
| item_category        | integer    | null: false                    |
| item_status          | integer    | null: false                    | 
| shipping_fee_status  | integer    | null: false                    |
| prefecture           | integer    | null: false                    |
| scheduled_delivery   | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :item_category
- belongs_to_active_hash :item-status
- belongs_to_active_hash :shipping_fee_status
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :scheduled_delivery


##  orders テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |
| address              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address


##  addresses テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| post_code            | integer    | null: false                    |
| prefecture           | string     | null: false                    |
| city                 | string     | null: false                    |
| street               | string     | null: false                    |
| building             | string     |                                |
| phone_number         | string     | null: false                    |
| dest_last_name       | string     | null: false                    |
| dest_first_name      | string     | null: false                    |
| dest_last_name_kana  | string     | null: false                    |
| dest_first_name_kana | string     | null: false                    |

### Association

- belongs_to :user
- has_many :orders