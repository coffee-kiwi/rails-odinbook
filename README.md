# Odinbook
英語の後に日本語が続きます。

## 🌟 Highlights
- A Facebook-inspired social networking application with the option to create an account or use a one-click Guest Login, allowing visitors to explore the application without registering.
- Users can create posts, comment on posts, and like content.
- Users can send and manage follow requests. Once a request is accepted, the follower can view that user's posts.
- Authentication is implemented with Devise, with OmniAuth providing additional sign-up and login options.
- User-uploaded images are handled with Active Storage and MiniMagick and stored using Google Cloud Storage.
- Built with Ruby on Rails 8 and PostgreSQL and deployed to Render.
- Includes a shared Guest account designed for portfolio visitors, with profile and account changes restricted to preserve the demo account between sessions.


## 🚀 Usage
- To try out the application, visit: [odinbook-jiuf.onrender.com](https://odinbook-jiuf.onrender.com/)
- You can explore Odinbook without creating an account by selecting "Try Odinbook as a Guest / ゲストとしてOdinbookを試す" on the login or sign-up page.
- The Guest account can be used to try the application's main social features, including creating posts, commenting, liking posts, and interacting with other users. To keep the shared demo account consistent for future visitors, its profile and account information cannot be changed.
- Odinbook is hosted on Render's free tier, so the application may take up to a minute to start after a period of inactivity. If the page does not load correctly on the first attempt, please wait a moment and refresh the page. Occasionally, more than one refresh may be required.


## ℹ️ Overview 
Odinbook is the capstone project of the Ruby on Rails course from [The Odin Project - Odinbook](https://www.theodinproject.com/lessons/ruby-on-rails-odin-book). I built the application from the ground up, working from the project's requirements to plan and implement its models, controllers, views, authentication, social features, image handling, and deployment.

Throughout development, I broke larger requirements into smaller problems, researched unfamiliar technologies through documentation, debugged issues across both development and production environments, and iteratively improved the application as I encountered new challenges.

Although the curriculum primarily focuses on backend development and does not require extensive styling, I also designed and implemented the frontend to provide a consistent and responsive experience across different screen sizes.


## 💻 Tech Stack: 
- Backend: Ruby on Rails 8
- Frontend: HTML5, CSS3, Hotwire (Turbo)
- Database: PostgreSQL
- Authentication: Devise, OmniAuth
- Image Handling: Active Storage, MiniMagick
- Cloud Storage: Google Cloud Storage
- Version Control: Git, GitHub
- Deployment: Docker, Render


## ⚠️ Challenges and What I Learned

### 🔄 Hotwire and Turbo Streams:
This was my first project using Hotwire and Turbo Streams. Initially, I found it challenging to understand how the different partials, Turbo Stream responses, controllers, and views interacted with one another. I worked through the documentation and curriculum material, traced the request/response flow, and implemented the functionality incrementally, building my understanding of how the pieces connected.

### 🐳 Production Deployment:
Deploying Odinbook introduced issues that did not appear in my local development environment. I learned to use production logs to isolate individual problems rather than attempting to solve several errors at once. Working through these issues gave me practical experience debugging differences between development and production environments and working with Render, PostgreSQL, and the application's Docker-based deployment setup.

### 👤 Guest Login:
I later added a one-click Guest Login so that portfolio visitors could explore the application without registering. This required creating an idempotent seed for the shared Guest account, implementing a dedicated Guest Login route and controller, and ensuring the account existed correctly in the production database. I also added server-side restrictions to prevent visitors from changing the shared account's profile and account information while keeping the application's normal social functionality available.


## ✍️ Author 
My name is Conor. I am currently transitioning into web development after approximately 10 years of professional experience in education in Japan and Taiwan. I have been developing my skills through The Odin Project's Full Stack Ruby on Rails curriculum and building projects with Ruby on Rails, JavaScript, PostgreSQL, Git, HTML, and CSS.

I am now looking to begin my professional career as a web engineer and continue developing my skills through real-world software development.
You can find more about me on: 
- [My Portfolio](https://coffee-kiwi.github.io/) 


## 💭 Feedback and Contributing
Please feel free to leave comments or report any bugs in the [discussions section](https://github.com/coffee-kiwi/rails-odinbook/discussions).

If you have any questions or ideas for improvements, feel free to share them there as well.

#　日本語　

## 🌟 主な特徴
- Facebookを参考にしたSNSアプリケーションです。アカウントを作成するか、ワンクリックのゲストログインを利用することができ、アカウント登録をせずにアプリの機能をお試しいただけます。
- 投稿の作成、コメント、「いいね」などの機能を利用できます。
- 他のユーザーにフォローリクエストを送信・管理できます。リクエストが承認されると、フォローしたユーザーの投稿を閲覧できるようになります。
- ユーザー認証にはDeviseを使用し、OmniAuthによるサインアップ・ログインにも対応しています。
- ユーザーがアップロードした画像はActive StorageとMiniMagickで処理し、Google Cloud Storageに保存しています。
- Ruby on Rails 8とPostgreSQLを使用して構築し、Renderにデプロイしています。
- ポートフォリオを閲覧する方がアプリを試せるよう、共有のゲストアカウントを用意しています。他の利用者も同じ状態で利用できるよう、ゲストアカウントのプロフィールおよびアカウント情報は変更できない仕様にしています。


## 🚀 使用方法
- アプリケーションはこちらからお試しいただけます：[odinbook-jiuf.onrender.com](https://odinbook-jiuf.onrender.com/)

- ログインページまたは新規登録ページで **「Try Odinbook as a Guest / ゲストとしてOdinbookを試す」** を選択すると、アカウントを作成せずにOdinbookをご利用いただけます。

- ゲストアカウントでは、投稿の作成、コメント、「いいね」、他のユーザーとの交流など、アプリの主なSNS機能をお試しいただけます。今後利用する方も同じ状態で共有デモアカウントを利用できるよう、ゲストアカウントのプロフィールおよびアカウント情報は変更できない仕様にしています。

- OdinbookはRenderの無料プランで公開しているため、一定時間アクセスがない場合、アプリの起動に最大1分ほどかかることがあります。初回アクセス時に正常に表示されない場合は、少し時間をおいてからページを再読み込みしてください。場合によっては、複数回の再読み込みが必要になることがあります。


## ℹ️ 概要
Odinbookは、[The Odin Project - Odinbook](https://www.theodinproject.com/lessons/ruby-on-rails-odin-book) のRuby on Railsコースにおける集大成となるプロジェクトです。プロジェクトの要件をもとにゼロからアプリケーションを構築し、モデル、コントローラー、ビュー、認証機能、SNS機能、画像処理、デプロイまでを自分で計画し、実装しました。

開発を進める中で、大きな要件を小さな課題に分解し、初めて扱う技術についてはドキュメントを調べながら理解を深めました。また、開発環境と本番環境の両方で発生した問題をデバッグし、新たな課題に直面するたびに改善を重ねながらアプリケーションを完成させました。

このカリキュラムは主にバックエンド開発に重点を置いており、本格的なスタイリングは必須ではありませんが、さまざまな画面サイズで一貫性のあるレスポンシブな表示になるよう、フロントエンドのデザインと実装にも取り組みました。


## 💻 技術スタック
- バックエンド: Ruby on Rails 8
- フロントエンド: HTML5, CSS3, Hotwire (Turbo)
- データベース: PostgreSQL
- 認証: Devise, OmniAuth
- 画像処理: Active Storage, MiniMagick
- クラウドストレージ: Google Cloud Storage
- バージョン管理: Git, GitHub
- デプロイ: Docker, Render


## ⚠️ 課題と学んだこと

### 🔄 HotwireとTurbo Streams
このプロジェクトで初めてHotwireとTurbo Streamsを使用しました。当初は、さまざまなパーシャル、Turbo Streamのレスポンス、コントローラー、ビューがどのように連携しているのかを理解することに苦労しました。ドキュメントやカリキュラムの教材を確認しながら、リクエストからレスポンスまでの流れを追い、機能を一つずつ実装することで、それぞれの要素がどのようにつながっているのか理解を深めていきました。


### 🐳 本番環境へのデプロイ
Odinbookをデプロイした際、ローカルの開発環境では発生しなかった問題がいくつか発生しました。複数のエラーを一度に解決しようとするのではなく、本番環境のログを確認しながら問題を一つずつ切り分けて原因を特定する方法を学びました。これらの問題に取り組むことで、開発環境と本番環境の違いによって発生する問題のデバッグに加え、Render、PostgreSQL、Dockerを利用したアプリケーションのデプロイ構成についても実践的に学ぶことができました。


### 👤 ゲストログイン
その後、ポートフォリオを閲覧する方がアカウント登録をせずにアプリケーションを試せるよう、ワンクリックのゲストログイン機能を追加しました。この機能の実装では、共有ゲストアカウント用の冪等性を持つシード処理を作成し、ゲストログイン専用のルートとコントローラーを実装するとともに、本番データベース上でもゲストアカウントが正しく作成されるよう対応しました。また、通常のSNS機能は利用できる状態を維持しながら、共有アカウントのプロフィールやアカウント情報を変更できないよう、サーバー側で制限を実装しました。


## ✍️ 作者
Conor（コナー）です。日本と台湾の教育業界で約10年間の実務経験を積んだ後、現在はWeb開発へのキャリアチェンジに取り組んでいます。The Odin ProjectのFull Stack Ruby on Railsカリキュラムを通してスキルを身につけながら、Ruby on Rails、JavaScript、PostgreSQL、Git、HTML、CSSを使ったプロジェクトを開発しています。

今後はWebエンジニアとして実務経験を積み、実際のソフトウェア開発を通して、さらにスキルを伸ばしていきたいと考えています。
詳しくはこちらをご覧ください：
- [ポートフォリオ](https://coffee-kiwi.github.io/)


## 💭 フィードバック・コントリビューション
コメントやバグを見つけた場合は、[Discussions](https://github.com/coffee-kiwi/rails-odinbook/discussions) からお気軽にお知らせください。

ご質問や改善のアイデアなどもありましたら、ぜひDiscussionsで共有していただければと思います。