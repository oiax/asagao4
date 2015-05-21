# 『改訂3版 基礎Ruby on Rails』サンプルソース

『改訂3版 基礎Ruby on Rails』（2015年5月、インプレス刊）のサンプルソースです。

書籍情報：http://book.impress.co.jp/books/1114101096<br />
Amazon：http://www.amazon.co.jp/dp/4844338153/

読者サポートページ：http://www.oiax.jp/rails4book

## 動作確認環境

Ruby 2.2.1または2.2.2、Ruby on Rails 4.2.1<br />
Windowsでは、Ruby 2.1.5または2.1.6をお使いください。

## 使い方

### ダウンロード

次のどちらかでソースコードを入手できます。

* `git`コマンドの`git clone`を使う。

````
% git clone git@github.com:oiax/asagao4.git
````

* 右の「Download ZIP」よりZIPファイルをダウンロードして展開する。

### サンプルプログラムの実行

フォルダ`chapter1`、`chapter3`から`chapter7`、`section8-1`から`section9-5`の中にRailsのプログラムがあります。

サンプルを実行したい章、節のフォルダに移動して、`bundle`コマンドを実行してください。

````
mac:~ taro% cd asagao4/chapter3
mac:chapter3 taro% bundle install
````

Chapter 4以降では、Rakeの`db:reset`タスクで、データベースの初期化を行ってください。

````
mac:chapter4 taro% bin/rake db:reset
````

`bin/rails s`コマンドでRailsプログラムが起動します。

````
mac:chapter4 taro% bin/rails s
````

### Windowsの場合

Windowsでは、`bundle`コマンドを実行する前に、DevKitとSSL証明書の設定を行ってください（本書23-24ページを参照）。

````
C:¥asagao4¥chapter4> C:¥devkit¥devkitvars
C:¥asagao4¥chapter4> set SSL_CERT_FILE=C:¥Users¥taro¥cacert.pem
C:¥asagao4¥chapter4> bundle install
````

`bin/`で始まるコマンドの前には`ruby`を付けてください

````
C:¥asagao4¥chapter4> ruby bin/rake db:reset
C:¥asagao4¥chapter4> ruby bin/rails s
````
