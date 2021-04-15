# TYPE PROGRAMMING  

## アプリケーション概要  
簡単なプログラミングのコードをタイピングゲーム形式で学習できます。  
ゲーム内で使用するコードは各ユーザーが投稿フォームから作成でき、  
その投稿データでタイピングゲームを通してプログラミングに触れてもらうアプリケーションです。  
  
## URL  
https://type-programming.herokuapp.com/
  
## テスト用アカウント  
(BASIC認証）  
ユーザー：test  
PASSWORD：tech95  
(ログイン)  
ユーザー：test  
PASSWORD：tech95
  
## 利用方法  
①ユーザー名、メールアドレス、パスワードでユーザー登録  
②自身で考えたプログラミングコードの問題文、回答コード、解説文、難易度を入力して問題を作成  
③タイピングゲーム形式でプログラミングコードを学習  
④より高いスコアを目指しつつプログラミングの理解を深めよう！  
  
## 目指した課題解決  
想定対象ユーザーは、プログラミング基礎学習を終えた人や、  
義務教育でプログラミングを学習したばかりの学生。  
基礎学習の後にプログラミングの理解を深め知見を広げるために大切なことの１つは、  
さまざまなコードに触れて実際に記述してみることだと思います。  
そして何よりプログラムを素早くタイピングできたら楽しい！  
その楽しさを通して学習できることを目的としています。  
  
## 要件定義  
ユーザー登録  
ゲーム機能  
ゲームレコード機能  
問題登録機能  
問題編集・削除機能  
ランキング機能  
ユーザープロフィール  
SNS認証  
投稿問題へのコメント機能  
問題ごとのタイピング記録の保存  
  
## 機能説明  
実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。
  
## 実装予定機能  
SNS認証  
投稿問題へのコメント機能  
問題ごとのタイピング記録の保存  
  
## データベース設計  
### ER図  
  
### users テーブル
| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| username            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |

#### Association
has_many :questions
has_one  :game


### questions テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| title               | text       | null: false                    |
| answer              | text       | null: false                    |
| commentary          | text       | null: false                    |
| question_level_id   | integer    | null, false                    |

#### Association
belongs_to :user


### game テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| record_1st     | integer    | null: false                    |
| record_2nd     | integer    | null: false                    |
| record_3rd     | integer    | null: false                    |

#### Association
belongs_to :user
  
## ローカル動作方法  
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。
