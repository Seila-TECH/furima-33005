# テーブル設計

## users テーブル

| Column          | Type        | Options                   |
| --------------- | ----------- | ------------------------- |
| nickname        | string      | null: false               |
| email           | string      | null: false, unique: true |
| password        | string      | null: false               |
| first_name      | string      | null: false               |
| last_name       | string      | null: false               |
| first_name_furi | string      | null: false               |
| last_name_furi  | string      | null: false               |
| birthday        | date        | null: false               |

### Association

- has_many :items
- has_many :payments

## items テーブル

| Column          | Type        | Options              |
| --------------- | ----------- | -------------------- |
| item_image      |             |                      |
| item_name       | string      | null: false          |
| item_profile    | text        | null: false          |
| category        | string      | null: false          |
| item_status     | string      | null: false          |
| shipping_fee    | string      | null: false          |
| shipping_area   | string      | null: false          |
| shipping_date   | string      | null: false          |
| price           | integer     | null: false          |
| user            | references  | foreign_key: true    |
| payment         | references  | foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :payment

## payments テーブル

| Column          | Type        | Options              |
| --------------- | ----------- | -------------------- |
| card_number     | string      | null: false          |
| card_date       | date        | null: false          |
| security_code   | integer     | null: false          |
| postal          | string      | null: false          |
| city            | string      | null: false          |
| address         | string      | null: false          |
| address_number  | string      | null: false          |
| address_piso    | string      | null: false          |
| phone_number    | integer     | null: false          |
| user            | references  | foreign_key: true    |

### Association

- has_many :items
- belongs_to :user
