### <font style="color: red;">TYPE PROGRAMMING</font>  
---------------  

#### アプリケーション概要  
---------------  
簡単なプログラミングのコードをタイピングゲーム形式で学習できます。  
ゲーム内で使用するコードは各ユーザーが投稿フォームから作成でき、  
その投稿データでタイピングゲームを通してプログラミングに触れてもらうアプリケーションです。  

URL：https://type-programming.herokuapp.com/

テスト用アカウント：  
(BASIC認証）  
ユーザー：test  
PASSWORD：tech95  
(ログイン)  
ユーザー：test  
PASSWORD：tech95

利用方法	このアプリケーションの利用方法を記述。

目指した課題解決	このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。

洗い出した要件	スプレッドシートにまとめた要件定義を記述。

実装した機能についての画像やGIFおよびその説明	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。

実装予定の機能	洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。

データベース設計	ER図等を添付。

ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。


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
