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
・ユーザー登録  
・ゲーム機能  
・ゲームレコード機能  
・問題登録機能  
・問題詳細表示機能 
・問題編集・削除機能  
・ランキング機能  
・ユーザープロフィール  
・SNS認証  
・投稿問題へのコメント機能  
・問題ごとのタイピング記録の保存  
  
## 機能説明  
### ・ユーザー登録  
ユーザー名、メールアドレス、パスワードでユーザー登録  
ユーザー登録をすると、問題の投稿、ゲームプレイができます。  
### ・ゲーム機能  
黒枠内に表示されるコードをタイピングします。  
入力された文字は赤くなり、全て入力すると次の問題が出題されます。  
計５問の総合タイムからスコアが算出されます。  
<img src="https://i.gyazo.com/f0d00252ed43bed39d4226b5bb718971.png" alt="ゲーム機能" width="500">   
### ・ゲームレコード機能  
タイピングタイムからスコアが算出されます。  
その情報をユーザー情報に紐付けて、ハイスコア順に最大３つ保存します。  
<img src="https://i.gyazo.com/2b8d0d3c9f91665428a1732dde489f22.png" alt="ゲームレコード機能" width="350">   
### ・問題登録機能  
問題文、回答コード、解説文、難易度を入力すると、  
ユーザーはタイピングゲームの問題を投稿することができる。  
<img src="https://s27.aconvert.com/convert/p3r68-cdx67/b0qt1-042ul.gif" alt="問題登録" width="500">   

### ・問題詳細表示機能  
問題文、回答コード、解説文、難易度の問題の詳細情報を表示できる。  
<img src="https://i.gyazo.com/e481f57346da3f0ce7f6d11854de16a1.png" alt="問題詳細表示" width="500">   

### ・問題編集・削除機能  
問題詳細表示内に投稿ユーザーであれば、
編集・削除ボタンが表示され問題の編集・削除ができる。
<img src="https://i.gyazo.com/5e9772e737ae08145c52d97fc79962a4.png" alt="問題編集・削除" width="500">  

### ・ランキング機能  
タイピングスコアの上位10名のユーザーを表示。  
<img src="https://i.gyazo.com/6043be2c2a3d62bab85c1cb74c460f9f.png" alt="ランキング" width="500">   

### ・ユーザープロフィール  
タイピングスコアのベスト3、投稿した問題一覧とユーザー名が表示できる。  
<img src="https://i.gyazo.com/5a3c9ea7c9f6d0d3424ddf3cfad6ab4a.png" alt="ユーザープロフィール" width="500">   


  
## 実装予定機能  
### ・SNS認証  
ユーザー登録をSNS(twitterなど)の情報で認証できるようにする  

### ・投稿問題へのコメント機能  
投稿された問題に対してコードレビューなどができる機能  

### ・問題ごとのタイピング記録の保存  
現状では5問回答したスコアを保存しているが、  
各問題ごとのタイムで保存する機能  
  
## データベース設計  
### ER図  
<img src="https://i.gyazo.com/7b69cf7c690d9ad9c447785bc63c0b35.png" alt="ER図" width="350">   
  
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
  
## 開発環境  
### バックエンド  
Ruby v2.6.5 / Ruby on Rails v6.0.3.6  
### フロントエンド
HTML / CSS / JavaScript  
### データベース
MySQL  
### Web・アプリケーションサーバー(本番環境)  
Heroku  
### ソース管理  
GitHub / GitHubDesktop  
### テスト  
RSpec  
### エディタ  
VSCode  
