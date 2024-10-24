# ollama docker compose

## イントロダクション

このプロジェクトは、ollama+open-webui 環境を docker compose を用いてローカルに構築することを目的としています。
これにより、**セキュアで手軽な無料の** AI コーディング支援環境の構築が可能になります。

## ローカル ollama+open-webui 環境構築

前提として、docker, docker compose 環境は構築済みとします。

### 構築手順

#### NVIDIA GPU 利用の場合

NVIDIA コンテナを利用するためには、以下の手順で設定を行います。

リポジトリを設定します。

```
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey |sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
&& curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list \
&& sudo apt-get update
```

NVIDIA Container Toolkit パッケージをインストールします。

```
sudo apt-get install -y nvidia-container-toolkit
```

nvidia-ctk コマンドを使用して、コンテナランタイムを設定します。

```
sudo nvidia-ctk runtime configure --runtime=docker
```

Docker デーモンを再起動します。

```
sudo systemctl restart docker
```

ollama+open-webui コンテナを起動します。

```
docker compose up -d
```

#### GPU を利用しない場合

TBD

### 動作確認

#### ollama

以下のコマンドで LLM を起動します。

```
docker compose exec ollama ollama run llama3
```

初回は LLM がインストールされますが、少々時間がかかります。

セッションを終了するには`/bye`と入力します。

#### open-webui

http://localhost:8080 にアクセスして、WebUI が表示されることを確認します。
また、ログイン後に画面上部に表示されるプルダウンでインストール済みのモデルが選択できることを確認します。

### (オプション) 複数ユーザでモデルを共有したい場合

仕事用とプライベートなどでユーザを分けている場合、複数ユーザでモデルを共有するためには、`ollama` のディレクトリを共有する必要があります。
そのため ollama ディレクトリを共有ディレクトリへのシンボリックリンクに変更します。
リポジトリのトップディレクトリで以下を実行してください。

ollama ディレクトリを共有ディレクトリに移動

```
sudo mv ./ollama /opt/
```

シンボリックリンクを張る

```
sudo ln -s /opt/ollama ./ollama
```

書き込み権限を追加する

```
sudo chmod a+w ollama
```

## vscode でのコード補完を有効にする

事前に対話セッションやコード補完で使用したいモデルをインストールしてください。

```
docker compose exec ollama ollama pull [model]
```

使用可能なモデルは[こちら](https://ollama.com/library)を参照してください。

vscode でのコード補完を有効にするためには、拡張機能の`continue`をインストールし、`~/.continue/config.json`を以下のように修正します。

```
"models": [
    {
      "title": "[model]",
      "model": "[model]",
      "apiBase": "http://localhost:11434",
      "provider": "ollama"
    },
    {
      "model": "claude-3-5-sonnet-20240620",
      "provider": "anthropic",
      "apiKey": "",
      "title": "Claude 3.5 Sonnet"
    }
],
"tabAutocompleteModel": {
    "title": "[model]",
    "model": "[model]",
    "apiBase": "http://localhost:11434",
    "provider": "ollama"
},
```

## open-interpreterを利用する

以下のコマンドで対話セッションが開始します。

```
docker compose run --rm oi
```
