### README

# Archi_Log

![トップ画](https://user-images.githubusercontent.com/67260509/94368027-0b49d700-011d-11eb-883f-5568a015a3e7.png)

## peopleテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|icon|string||
### Association

## writersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|icon|string||
### Association
- has_many :articles

## articlesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text||
|image|string||
|favorite|string||
|writer_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :writer
- has_many :articles_tags
- has_many :tags, through: :articles_tags

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :articles_tags
- has_many :articles, through: :articles_tags

## articles_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|article_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :article
- belongs_to :tag
