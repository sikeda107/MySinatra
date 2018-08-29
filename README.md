# MySinatra

* [Sinatra 公式](http://sinatrarb.com/)   
* [Dotinstall Sinatra 入門](https://dotinstall.com/lessons/basic_sinatra_v2)   

## SinatraのGemインストール
```
$ gem install sinatra sinatra-contrib activerecord rack_csrf sqlite3 --no-document
```

## DBのシード設定
```
$ sqlite3 bbs.db < seeds.sql
$ sqlite3 bbs.db
SQLite version 3.19.3 2017-06-27 16:48:08
Enter ".help" for usage hints.
sqlite> select * from comments;
1|comment 1
2|comment 2
3|comment 3
4|comment 4
sqlite> .quit
```

##
