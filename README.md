# 不明な語を自動で検索するスクリプト

## 仕様

* 入力としてテキストファイルを受け取る（マークダウン可）
* テキストの中から?がついた単語を抽出し、それぞれGoogle検索する
* 検索結果の上位や、wikipediaなどの概要文をまとめたテキストファイルを出力する

## イメージ

こんな感じのメモ（知らない単語や気になったことに?がついてる）を入力として
[![メモ.png](https://bootcamp.fjord.jp/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOUM3QVE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--51cb06599290573cbfb01bc820a0ba51211d6712/%E3%83%A1%E3%83%A2.png)](https://bootcamp.fjord.jp/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOUM3QVE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--51cb06599290573cbfb01bc820a0ba51211d6712/%E3%83%A1%E3%83%A2.png)

こんな感じで？のついた単語を自動的に検索して吐き出してほしい
[![メモ_search_md.png](https://bootcamp.fjord.jp/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOCs3QVE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--eebd1a9c09a719029e8175ea46a118f2a3c53aec/%E3%83%A1%E3%83%A2_search_md.png)](https://bootcamp.fjord.jp/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBOCs3QVE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--eebd1a9c09a719029e8175ea46a118f2a3c53aec/%E3%83%A1%E3%83%A2_search_md.png)

## 現在作成途中です

現状：入力されたファイルから？のついた部分を抽出するところまで

## 注意
現バージョンではテストを実行すると二つ上のディレクトリにテスト用のサンプルファイルが生成されます。
