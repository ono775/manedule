# アプリ名
### Manedule(マネジュール)

# 概要
- 撮影技術会社のスケジュール管理と、機材の在庫管理を行うことが出来ます
- スケジュールの新規作成や編集はログインユーザーのみで、その他の人は閲覧のみ出来ます

# 制作背景(意図)
現職はテレビなどの撮影技術を行っています。  
現在の職場で起こる問題として、機材の割り振りが出来ておらず使用当日に必要な機材が無かった、ということが多々ありました。  
一番の理由は個人の確認不足ですが、日々の仕事に追われて間違えてしまったり、出張などで会社に
行くことが出来ないことも問題だと思います。  
アナログである、現場に出ていると確認出来ない、確認したい時に会社に人がいないなどを解決し、いつでも確認できるアプリケーションがあるとミスも減るのでは無いかと思い作成しようと思いました。

# DEMO

# 実装予定の内容
- ### ユーザー管理機能  
      新規登録
      ログイン
- ### スケジュール管理機能  
      新規作成
      編集、削除
- ### 在庫管理機能  
      機材の状態(修理中など)
      予約状況
- ### 通知機能
      管理者(ログインユーザー)が人員の変更など行うとポップアップなどで表示

# DB設計
## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :schedules
- has_many :items

## schedulesテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| start_date    | date       | null: false                    |
| end_date      | date       | null: false                    |
| client        | string     | null: false                    |
| title         | string     | null: false                    |
| content       | text       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :schedule_items
- has_many :items, through: :schedule_items
- has_many :members

## itemsテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name_id | integer    | null: false, uniqueness: true  |
| status_id    | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| schedule     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :schedule_items
- belongs_to :schedule, through: :schedule_items

## schedule_itemsテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| schedule_id | integer    |                                |
| ite_id      | integer    |                                |

### Association
- belongs_to :schedule
- belongs_to :item

## membersテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name_id     | integer    | null: false                    |
| position_id | integer    | null: false                    |
| schedule    | references | null: false, foreign_key: true |

### Association
- belongs_to :schedule