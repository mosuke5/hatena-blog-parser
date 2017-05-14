はてなブログのエクスポートファイルをパースしHugoフォーマットに変換する。

## 実行方法
```
$ bundle install --path=vendor/bundle
$ bundle exec ruby convert.rb test.txt
```

## はてなブログのエクスポートファイルのパース結果
```
[
  {
    "CATEGORY"=>["mosuke5", "ドメイン"],
    "AUTHOR"=>"mosuke5",
    "TITLE"=>"(備忘録) 運用サイトのドメインとサーバ",
    "BASENAME"=>"2017/04/23/154957",
    "STATUS"=>"Publish",
    "ALLOW COMMENTS"=>"1",
    "CONVERT BREAKS"=>"0",
    "DATE"=>"04/23/2017 15:49:57",
    "BODY"=>"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  },
  {
    "CATEGORY"=>["mosuke5", "ドメイン"],
    "AUTHOR"=>"mosuke5",
    "TITLE"=>"(備忘録) 運用サイトのドメインとサーバ",
    "BASENAME"=>"2017/04/23/154957",
    "STATUS"=>"Publish",
    "ALLOW COMMENTS"=>"1",
    "CONVERT BREAKS"=>"0",
    "DATE"=>"04/23/2017 15:49:57",
    "BODY"=>"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  }
]
```

## Hugoファイル
```
+++
Categories = ["オブジェクトストレージ", "ObjectStorage", "クラウド", "S3"]
Description = " 1.はじめに  Amazon S3をはじめとして、オブジェクトストレージが身近になってきています。 各クラウドベンダーはオブジェクトストレージサービスを提供しています。   Amazon S3  Azure Blob Storage  G"
Tags = ["オブジェクトストレージ", "ObjectStorage", "クラウド", "S3"]
date = "2017-03-18T18:22:00+9:00"
title = "万能じゃない。オブジェクトストレージの仕組みと利用を正しく理解する"
author = "mosuke5"
archive = ["2017"]
+++

<h2>1.はじめに</h2>

<p><a class="keyword" href="http://d.hatena.ne.jp/keyword/Amazon%20S3">Amazon S3</a>をはじめとして、オブジェクトストレージが身近になってきています。<br/>
各<a class="keyword" href="http://d.hatena.ne.jp/keyword/%A5%AF%A5%E9%A5%A6%A5%C9">クラウド</a>ベンダーはオブジェクトストレージサービスを提供しています。</p>

<ul>
<li><a href="http://docs.aws.amazon.com/ja_jp/AmazonS3/latest/dev/Welcome.html" target="_blank">Amazon S3</a></li>
<li><a href="https://docs.microsoft.com/ja-jp/azure/storage/storage-introduction" target="_blank">Azure Blob Storage</a></li>
<li><a href="https://cloud.google.com/storage/" target="_blank">Google Cloud Storage</a></li>
<li><a href="https://jp.aliyun.com/product/oss" target="_blank">Alibaba Cloud OSS</a></li>
<li><a href="http://www.ntt.com/business/services/cloud/iaas/cloudn/storage.html" target="_blank">Cloud n ObjectStorage</a></li>
<li><a href="https://www.idcf.jp/cloud/storage/" target="_blank">IDCF オブジェクトストレージ</a></li>
</ul>


<p>ですが、オブジェクトストレージをストレージの魔法として理解されているケースも多いように感じます。<br/>
原点に振り返ってそもそもオブジェクトストレージとはなんなのか。<br/>
どんな特徴を持っているストレージなのか。<br/>
気になってまとめました。</p>
```
