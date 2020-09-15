This is yoshimok's terraform template repository.

https://www.terraform.io/docs/providers/index.html

## ディレクトリ構成

```
.
├─ Azure                    # Provider
│  ├─ environments
│  │  ├─ environment1
│  │  │  ├─ main.tf
│  │  │  ├─ params.tfvars   # credentials (ignore)
│  │  │  └─ variables.tf
│  │  └─ environment2
│  │     ├─ main.tf
│  │     ├─ params.tfvars   # credentials (ignore)
│  │     └─ variables.tf
│  └─ modules
│     ├─ module1 
│     │  ├─ main.tf
│     │  ├─ variables.tf
│     │  └─ output.tf
│     └─ module2 
│        ├─ main.tf
│        └─ variables.tf
├─ AWS                      # Provider
│           ・
│           ・
│           ・
├─ .gitignore
└─ readme.md                # It's me!!
```

Providerごとにディレクトリを分けて管理。
それぞれ以下の要素で構成される


### environments

ひとまとりのグループとしてリソースを複数個定義して使用。

基本的に、以下を定義するものとしている。
- 構成リソースの定義
- リソースの設定値（命名等）

またパスワードなど、あまり知られたくないような情報を使用する際にはparams.tfvarsに記述する。

### modules

リソース定義。
リソース群をここに定義し、environmentsでこれらを使いリソースの作成を行う。
環境ごとに変動する箇所は変数として定義する。

### commons.tf (option)

いるのかな。。？

## tfstateについて

そのうちクラウド上で保管しておくようにしたいが現在は、リポジトリで管理か？（ほかに使う人もいないだろうし。。）