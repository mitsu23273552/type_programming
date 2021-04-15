## users テーブル
| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| username            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |

### Association
has_many :questions
has_one  :game


## questions テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| title               | text       | null: false                    |
| answer              | text       | null: false                    |
| commentary          | text       | null: false                    |
| question_level_id   | integer    | null, false                    |

### Association
belongs_to :user


## game テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| record_1st     | integer    | null: false                    |
| record_2nd     | integer    | null: false                    |
| record_3rd     | integer    | null: false                    |

### Association
belongs_to :user
