# README

## usersテーブル
| column               | type   | options                   |
|:--------------------:|:------:|:-------------------------:|
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| last_name            | string | null: false               |
| first_name_kana      | string | null: false               |
| last_name_kana       | string | null: false               |
| birthday             | date   | null: false               |

###Asociation
- has_many :items
- has_many :buy_data

## itemsテーブル
| column               | type       | options                        |
|:--------------------:|:----------:|:------------------------------:|
| item_name            | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| postage_id           | integer    | null: false                    |
| delivery_area_id     | integer    | null: false                    |
| preparation_days_id  | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

###Asociation
- belongs_to :user
- has_one    :buy_data


## buy_dataテーブル
| column               | type       | options                        |
|:--------------------:|:----------:|:------------------------------:|
| item                 | references | null: false, foreign_key: true |
| user                 | references | null: false, foreign_key: true |

###Asociation
- belongs_to :user
- belongs_to :item
- has_one    :delivery_address


## delivery_addressテーブル
| column               | type       | options                        |
|:--------------------:|:----------:|:------------------------------:|
| postal_code          | string     | null: false                    |
| delivery_area_id     | integer    | null: false                    |
| city                 | string     | null: false                    |
| address_line         | string     | null: false                    |
| building_name        | string     |                                |
| phone_number         | string     | null: false                    |
| buy_data             | references | null: false, foreign_key: true |

###Asociation
- belongs_to :buy_data