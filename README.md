# テーブル設計

## users テーブル

| Column             | Type        | Options                   |
| ------------------ | ----------- | ------------------------- |
| nickname           | string      | null: false               |
| email              | string      | null: false, unique: true |
| encrypted_password | string      | null: false               |
| first_name         | string      | null: false               |
| last_name          | string      | null: false               |
| first_name_kana    | string      | null: false               |
| last_name_kana     | string      | null: false               |
| birthday           | date        | null: false               |

### Association

- has_many :items
- has_many :purchases

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

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column         | Type        | Options              |
| -------------- | ----------- | -------------------- |
| user           | references  | foreign_key: true    |
| item           | references  | foreign_key: true    |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping

# shipping テーブル

| Column           | Type        | Options              |
| ---------------- | ----------- | -------------------- |
| postal           | string      | null: false          |
| shipping_area_id | integer     | null: false          |
| address          | string      | null: false          |
| address_number   | string      | null: false          |
| address_building | string      |                      |
| phone_number     | string      | null: false          |
| purchase         | references  | foreign_key: true    |

### Association

- belongs_to :purchase
