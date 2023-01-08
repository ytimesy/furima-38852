# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false               |
| encrypted_password | string | null: false, unique: true |
| nickname           | string | null: false               |
| firstname          | string | null: false               |
| lastname           | string | null: false               |
| firstname_kana     | string | null: false               |
| lastname_kana      | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column              | Type         | Options                        |
| ------------------- | ------------ | ------------------------------ |
| name                | string       | null: false                    |
| content             | text         | null: false                    |
| category_id         | integer      | null: false                    |
| status_id           | integer      | null: false                    |
| deliveryfee_type_id | integer      | null: false                    |
| prefecture_id       | integer      | null: false                    |
| delivery_when_id    | integer      | null: false                    |
| itemfee             | integer      | null: false                    |
| user                | references   | null: false, foreign_key: true |

### Association

- has_one    :purchase
- belongs_to :user


## purchases テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| item               | references   | null: false, foreign_key: true |
| user               | references   | null: false, foreign_key: true |

### Association

- has_one    :delivery
- belongs_to :item
- belongs_to :user


## deliveries テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| postcode           | string       | null: false                    |
| prefecture_id      | integer      | null: false                    |
| city               | string       | null: false                    |
| address            | string       | null: false                    |
| building           | string       |                                |
| tel                | string       | null: false                    |
| purchase           | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase