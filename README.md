# ながのCAKE
長野県にある小さな洋菓子店、「ながのCAKE」の商品を通販するためのECサイト。
元々近隣樹民が主な顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

## 通販について
- 通販では注文に応じて製作する受注生産型としています。
- 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けていません。
- 送料は１配送につき全国一律８００円。
- 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送することができます。
- 支払い方法はクレジットカード、銀行振込から選択できます。

# 実装機能/使用方法
## User（顧客・会員側）
- 顧客は会員登録、ログイン・ログアウト、退会ができます。
- 会員のログインはメールアドレスとパスワードで行えます。
- 会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表示するなどして判断できます。
- サイトの閲覧はログインなしで行えます。
- 商品をカートに入れ、1度に複数種類、複数商品の購入ができます。また、カート内の商品は個数変更・削除ができます。
- カートへの商品追加はログインなしでは行えなえません。
- 会員はマイページからユーザ情報の閲覧・編集、注文履歴の閲覧、配送先の閲覧・編集ができます。
- 注文履歴には購入履歴ごとに下記の情報が表示されます。
  - 購入日
  - 購入内容(商品名、個数、金額など)
  - 購入価格総計
  - 送付先
  - ステータス(入金待ち/発送待ち/発送済み)
- 会員登録時、下記の情報をユーザ情報として入力できます。
  - 名前(姓・名)
  - 名前(カナ姓・カナ名)
  - 郵便番号
  - 住所
  - 電話番号
  - メールアドレス
  - パスワード
- 商品は税込価格で表示されます。

## Admin（店側）
- 管理者用メールアドレスとパスワードでログインできます。
- 商品の新規追加、編集、販売停止が行えます。
- 商品情報は下記のものを持っています。
  - 商品名
  - 商品説明文
  - ジャンル
  - 税抜価格
  - 商品画像
  - 販売ステータス(販売中/売り切れ)
- 会員登録されているユーザ情報の閲覧、編集、退会処理が行えます。
- ユーザの注文履歴が一覧・詳細表示できます。
- 注文履歴には注文ごとに下記の情報が表示されます。
  - 購入者
  - 購入日
  - 購入内容
  - 請求額合計
  - 送付先
  - 注文ステータス(入金待ち/入金済み/発送済み)
  - 製作ステータス(製作待ち/製作中/製作完了)
- 注文ステータス、製作ステータスの更新ができます。

## 使用言語
- HTML&CSS
- Ruby
- Javascript
- フレームワーク
  - Ruby on rails (6.1.7)

## Gem
- devise
- enum_help
- kaminari(1.2.1)

## 作成者
- 田口裕佳(ぐっさん)(https://github.com/yuka1990)
- 外村憲武(とのさん)(https://github.com/norikkun)
- 藤田爽和(さっちゃん)(https://github.com/atijuF)
