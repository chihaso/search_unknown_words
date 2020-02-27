# 不明な語を自動で検索するスクリプト

## 仕様
* 入力としてテキストファイルを受け取る（マークダウン可）
* テキストの中から?がついた単語を抽出し、それぞれGoogle検索する
* 検索結果の上位や、wikipediaなどの概要文をまとめたテキストファイルを出力する

## 現在作成途中です
入力されたファイルから？のついた部分を抽出するところまで作りました。 
なお、現バージョンではテストを実行すると二つ上のディレクトリにテスト用のサンプルファイルが生成されます。

## イメージ
こんな感じのメモ（知らない単語や気になったことに?がついてる）を入力として
[![メモ.png](https://bootcamp.fjord.jp/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOUM3QVE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--51cb06599290573cbfb01bc820a0ba51211d6712/%E3%83%A1%E3%83%A2.png)](https://bootcamp.fjord.jp/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOUM3QVE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--51cb06599290573cbfb01bc820a0ba51211d6712/%E3%83%A1%E3%83%A2.png)

こんな感じで？のついた単語を自動的に検索して吐き出してほしい
[![メモ_search_md.png](https://bootcamp.fjord.jp/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOCs3QVE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--eebd1a9c09a719029e8175ea46a118f2a3c53aec/%E3%83%A1%E3%83%A2_search_md.png)](https://bootcamp.fjord.jp/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOCs3QVE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--eebd1a9c09a719029e8175ea46a118f2a3c53aec/%E3%83%A1%E3%83%A2_search_md.png)


## 使い方
### 事前準備
GoogleのCustom Search APIキー、検索エンジンIDを発行する必要があります。

* Custom Search APIキーの発行はこちらから ⇨ https://developers.google.com/custom-search/v1/overview?hl=ja
* 検索エンジンIDの発行はこちらから ⇨ https://cse.google.com/cse/all

APIキー、検索エンジンIDを発行したら、下記の内容を"key.rb"という名前でプロジェクトルートに保存してください。

```ruby: key.rb
# frozen_string_literal: true

API_key = "ここに取得したAPIキーをペースト"
cx_key = "ここに取得した検索エンジンIDをペースト"

```
