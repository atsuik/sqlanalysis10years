# Dev containerで「10年戦えるデータ分析入門」

[10年戦えるデータ分析入門](https://www.sbcr.jp/product/4797376272/)のSQLを試すための環境をDevcontainerを使って整備しました。


## ローカルで実行

### 前提条件
Windows, Mac, Linuxで動作を確認しています。

以下の製品をあらかじめインストールしておいてください。

- [Docker](https://www.docker.com/get-started/)
- [VSCode](https://code.visualstudio.com/)
    - [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### 実行方法

このレポジトリをクローンし
```
$ git clone https://github.com/atsuik/sqlanalysis10years.git
```

レポジトリをVSCodeで開きます
```
$ cd sqlanalysis10years
$ code .
```

右下に表示される `Reopen in Container`をクリック、または`F1`でコマンドパレットを開き
`Dev Containers: Open Folder in Containers..`を実行するとContainerのビルドが行われVSCodeがContainerへ接続します。

## Github Codespacesで実行

### 前提条件
Githubのアカウントを持っていること

### 実行方法
GithubのRepositoryのページで`Code`の`Codespaces`タブを開き、`Create codespace on main`をクリックするとCodespaceが開始します。

個人用アカウントに付与されるCodespacesの無料時間については[Document](https://docs.github.com/ja/billing/managing-billing-for-github-codespaces/about-billing-for-github-codespaces)を確認してください。

## データのPostgreSQLへのロード

以下のコマンドで[『10年戦えるデータ分析入門』サポートページ](https://i.loveruby.net/stdsql/)で公開されているサンプルデータをダウンロードしてきて、PostgreSQLへデータをロードします。
```bash
$ ./load_data.sh
```

サンプルデータ(サイズ大)についてはこちらのシェルスクリプトでロードできます。
```bash
$ ./load_large_data.sh
```

サポートページの説明にあるようにサンプルデータ(サイズ大)には一部のテーブルのデータしか入っていないので、`load_data.sh`を先に実行してから`load_large_data.sh`を実行してください。

## SQL Client
SQLをPostgreSQLに対して実行する方法として
- Jupyter Notebookで`JupySQL`を使用
- VSCode Extensionの`PostgreSQL`を使用

を用意しています。


### JupySQL

[JupySQL](https://github.com/ploomber/jupysql)はJupyter NotebookでSQLを実行するためのプロダクトです。

`notebook/sample.ipynb`にサンプルコードがあるのでこれを参考に実行してください。
`ipynb`ファイルはVSCodeでnotebookを開く、

もしくはTerminalで

```
$ jupyter lab
```

を実行して、ログに表示されるURLをブラウザで開いてJupyterのWeb画面から開いて使用してください。
```
[C 2023-07-12 13:06:27.295 ServerApp] 

    Or copy and paste one of these URLs:
        http://localhost:8888/lab?token=e6cdeb23d3e8c48a00c07eaf97b0728308c1262d60dfba47
        http://127.0.0.1:8888/lab?token=e6cdeb23d3e8c48a00c07eaf97b0728308c1262d60dfba47
```

### VSCode Extension

VSCodeのExtensionである[PostgreSQL](https://marketplace.visualstudio.com/items?itemName=ckolkman.vscode-postgres)を使用してDBに接続します。

接続情報は以下の通りです。

- hostname: db
- user: postgres
- password: postgres
- port: 5432
- Use an ssl connection?: Standard Connection

使い方はExtensionのページを参照してください。