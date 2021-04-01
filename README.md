## users テーブル
| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| username            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |

### Association
has_many :questions
has_one  :record


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


## game_records テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| easy_record_1st     | string     |                                |
| easy_record_2nd     | string     |                                |
| easy_record_3rd     | string     |                                |
| normal_record_1st   | string     |                                |
| normal_record_2nd   | string     |                                |
| normal_record_3rd   | string     |                                |

### Association
belongs_to :user
