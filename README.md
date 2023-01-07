# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| nickname           | string | null: false |
| firstname          | string | null: false |
| lastname           | string | null: false |
| firstname_kana     | string | null: false |
| lastname_kana      | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :deliverys


## items テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| name               | string       | null: false                    |
| image              | image        | null: false                    |
| content            | text         | null: false                    |
| category           | integer      | null: false                    |
| status             | integer      | null: false                    |
| deliveryfee_type   | integer      | null: false                    |
| delivery_from      | integer      | null: false                    |
| delivery_when      | integer      | null: false                    |
| itemfee            | integer      | null: false                    |
| user               | references   | null: false, foreign_key: true |

### Association

- has_one    :delivery
- belongs_to :user


## deliverys テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| postcode           | string       | null: false                    |
| prefecture         | string       | null: false                    |
| city               | string       | null: false                    |
| address            | string       | null: false                    |
| building           | string       |                                |
| tel                | string       | null: false                    |
| item               | references   | null: false, foreign_key: true |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user