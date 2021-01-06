# テーブル設計

## users テーブル

| Column             | Type        | Options                   |
| ------------------ | ----------- | ------------------------- |
| nickname           | string      | null: false               |
| email              | string      | null: false, unique: true |
| encrypted_password | string      | null: false               |
| first_name         | string      | null: false               |
| last_name          | string      | null: false               |
| first_name_furi    | string      | null: false               |
| last_name_furi     | string      | null: false               |
| birthday           | date        | null: false               |
| purchase           | references  | foreign_key: true         |

### Association

- has_many :items
- belongs_to :purchase

## items テーブル

| Column           | Type        | Options              |
| ---------------- | ----------- | -------------------- |
| item_name        | string      | null: false          |
| item_profile     | text        | null: false          |
| category_id      | integer     | null: false          |
| item_status_id   | integer     | null: false          |
| shipping_fee_id  | integer     | null: false          |
| shipping_area_id | integer     | null: false          |
| shipping_date_id | integer     | null: false          |
| price            | integer     | null: false          |
| user             | references  | foreign_key: true    |
| purchase         | references  | foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :purchase

## purchases テーブル

| Column          | Type        | Options              |
| --------------- | ----------- | -------------------- |
| users           | references  | foreign_key: true    |
| items           | references  | foreign_key: true    |

### Association

- has_many :items
- has_many :users
- has_one :shipping

# shipping テーブル

| Column          | Type        | Options              |
| --------------- | ----------- | -------------------- |
| postal          | string      | null: false          |
| city            | string      | null: false          |
| address         | string      | null: false          |
| address_number  | string      | null: false          |
| address_piso    | string      |                      |
| phone_number    | integer     | null: false          |
| purchase        | references  | foreign_key: true    |

### Association

- belongs_to :purchase
