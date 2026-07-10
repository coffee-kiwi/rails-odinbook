This is the final project of the Ruby on Rails course from The Odin Project.

Aim of this project is to create a website like Facebook/X, where users may sign up, be authenticated to view content, create posts, view posts, request to follow other users, view posts from themselves and those who they are following.

The description of the project can be found on:
https://www.theodinproject.com/lessons/ruby-on-rails-odin-book

# オディンブック (Odinbook)
[デプロイ先リンク ([Live Link URL](https://odinbook-jiuf.onrender.com/))]

## 概要 (Overview)
Ruby on Railsで構築したSNSのクローンアプリケーションです。

## 主な機能 (Key Features)
* **ユーザー認証機能** (Deviseを使用したログイン・新規登録)
* **画像アップロード機能** (ActiveStorageによる画像共有)
* **リアルタイムコメント機能** (Hotwire / Turbo Streamsを使用した画面遷移なしの非同期更新)

## 技術スタック (Tech Stack)
* **Backend:** Ruby 3.x / Ruby on Rails 7.x
* **Frontend:** HTML5, CSS3, JavaScript, Hotwire (Turbo/Stimulus)
* **Database:** PostgreSQL
* **Infrastructure:** Render

## 困難だった点と解決策 (Challenges & Solutions)
* **課題:** Hotwire（Turbo Streams）の初導入時、ページ全体をリフレッシュせずにコメントをリアルタイムにDOMへ反映させる挙動の理解と実装に苦労しました。
* **解決策:** Rails公式ドキュメントやコミュニティのコードベースを読み込み、ストリームのルーティングとパーシャルのリレーションを正しく紐付けることで、スムーズなユーザー体験を実現しました。また、Renderへのデプロイ時におけるデータベースの接続エラーに対しても、環境変数の設定を見直すことで自力で解決しました。
