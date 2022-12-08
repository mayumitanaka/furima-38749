# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| name_kanji         | string | null: false |
| name_kana          | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :comments


## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| item_info            | text       | null: false                    |
| item_category        | string     | null: false                    |
| item_status          | string     | null: false                    | 
| item_price           | integer    | null: false                    |
| shipping_fee_status  | string     | null: false                    |
| prefecture           | string     | null: false                    |
| scheduled_delivery   | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order


##  orders テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |
| address              | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item


##  comments テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| text                 | text       | null: false                    |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item