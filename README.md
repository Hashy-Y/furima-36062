# README

## usersテーブル
| column               | type   | options     |
|:--------------------:|:------:|:-----------:|
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |
| first_name_kana      | string | null: false |
| last_name_kana       | string | null: false |
| birthday             | date   | null: false |

###Asociation
- has_many :items
- has_many :buy_data

## itemsテーブル
| column               | type    | options                        |
|:--------------------:|:-------:|:------------------------------:|
| image                | string  | null: false                    |
| item_name            | string  | null: false                    |
| description          | text    | null: false                    |
| category_id          | integer | null: false                    |
| condition_id         | integer | null: false                    |
| postage_id           | integer | null: false                    |
| derivery_area_id     | integer | null: false                    |
| preparation_days_id  | integer | null: false                    |
| user_id              | integer | null: false, foreign_key: true |

###Asociation
- belongs_to :user
- has_one    :buy_data
- belongs_to :categories
- belongs_to :conditions
- belongs_to :postages
- belongs_to :delivery_areas
- belongs_to :preparation_days

## categories(active_hash)
| column               | type    | options     |
|:--------------------:|:-------:|:-----------:|
| category             | integer | null: false |

###Asociation
- has_many :items

## conditions(active_hash)
| column               | type    | options     |
|:--------------------:|:-------:|:-----------:|
| condition            | integer | null: false |

###Asociation
- has_many :items

## postages(active_hash)
| column               | type    | options     |
|:--------------------:|:-------:|:-----------:|
| postage              | integer | null: false |

###Asociation
- has_many :items

## delivery_areas(active_hash)
| column               | type    | options     |
|:--------------------:|:-------:|:-----------:|
| delivery_area        | integer | null: false |

###Asociation
- has_many :items

## preparation_days(active_hash)
| column               | type    | options     |
|:--------------------:|:-------:|:-----------:|
| preparation_days     | integer | null: false |

###Asociation
- has_many :items

## buy_dataテーブル
| column               | type    | options                        |
|:--------------------:|:-------:|:------------------------------:|
| item_id              | integer | null: false, foreign_key: true |
| user_id              | integer | null: false, foreign_key: true |
| delivery_address_id  | integer | null: false, foreign_key: true |

###Asociation
- belongs_to :user
- belongs_to :item
- has_one    :delivery_address

## delivery_addressテーブル
| column               | type   | options     |
|:--------------------:|:------:|:-----------:|
| postal_code          | string | null: false |
| state                | string | null: false |
| city                 | string | null: false |
| address_line         | string | null: false |
| building_name        | string | null: false |
| phone_number         | string | null: false |
| last_name_kana       | string | null: false |
| birthday             | date   | null: false |

###Asociation
- belongs_to :buy_data
