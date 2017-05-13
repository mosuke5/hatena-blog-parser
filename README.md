はてなブログのエクスポートファイルをパースするスクリプト。
Hugoとか他のブログへ移行する際に役立てる。

## 実行方法
```
$ ruby convert.rb test.txt
```

## 結果
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
