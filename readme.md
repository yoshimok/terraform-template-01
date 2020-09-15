This is yoshimok's terraform template repository.

## ディレクトリ構成

```
.
├─ environments
│  ├─ environment1
│  │  ├─ main.tf
│  │  └─ variables.tf
│  └─ environment2
│     ├─ main.tf
│     └─ variables.tf
├─ modules
│  ├─ module1 
│  │  ├─ main.tf
│  │  ├─ variables.tf
│  │  └─ output.tf
│  └─ module2 
│     ├─ main.tf
│     └─ variables.tf
└─ readme.md    # It's me!!
```


### environments

ひとまとりのグループとしてリソースを複数個定義して使用。

基本的に、以下を定義するものとしている。
- 構成リソースの定義
- リソースの設定値（命名等）

### modules

リソース定義、使いまわす部分を統一化し、環境ごとに変動する箇所は変数として定義する。

## tfstateについて

そのうちクラウド上で保管しておくようにしたいが現在は、リポジトリで管理か？（ほかに使う人もいないだろうし。。）