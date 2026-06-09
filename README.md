# dotFiles

macOS向け開発環境設定管理リポジトリ。

## 設計方針

本環境は以下の役割分担を採用する。

* Neovim: コーディング
* VSCode: デバッグ
* SourceTree: Git操作
* Homebrew: パッケージ管理
* dotFiles: 設定管理

組み込み開発を主目的とし、STM32およびESP32の開発環境を整備する。

---

## セットアップ

新規Macへの環境構築は以下を参照。

* `docs/mac-setup.md`

---

## ドキュメント

### 環境構築

* `docs/mac-setup.md`

  * Mac初期セットアップ

### 開発環境

* `docs/stm32.md`

  * STM32開発環境

* `docs/esp32.md`

  * ESP32開発環境

### エディタ

* `docs/neovim.md`

  * Neovim設定

---

## リポジトリ構成

```text
dotFiles/
├── Brewfile
├── README.md
├── install.sh
├── docs/
├── git/
├── nvim/
├── templates/
└── zsh/
```

---

## Homebrew

パッケージ管理は Homebrew を利用する。

インストール

```bash
brew bundle
```

導入パッケージは `Brewfile` にて管理する。

---

## install.sh

シンボリックリンク作成を行う。

```bash
./install.sh
```

主な対象

```text
~/.zshrc
~/.gitconfig
~/.config/nvim
```

---

## zsh

シェル設定を管理する。

```text
zsh/
├── aliases/
├── tools/
└── ...
```

ツール固有のPATH設定は `zsh/tools` 配下で管理する。

例

```text
zsh/tools/stm32.zsh
```

---

## Neovim

Neovim設定を管理する。

```text
nvim/
```

プラグイン管理には lazy.nvim を利用する。

---

## STM32テンプレート

STM32プロジェクト共通設定を管理する。

```text
templates/stm32/
```

主な内容

```text
templates/stm32/
├── .vscode/
└── scripts/
```

### .vscode

VSCodeデバッグ設定。

```text
launch.json
tasks.json
```

### scripts

プロジェクト共通スクリプト。

```text
build.sh
clean.sh
flash.sh
```

新規STM32プロジェクト作成時にコピーして利用する。

---

## Git運用

Git操作は SourceTree を利用する。

設定ファイルは

```text
git/
```

で管理する。

---

## 今後の整備予定

* ESP32テンプレート作成
* Python開発環境整備
* Dart開発環境整備
* ドキュメント整備

