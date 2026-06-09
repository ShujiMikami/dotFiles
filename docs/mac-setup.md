# Mac開発環境セットアップ

対象環境

* Mac Pro 2012
* OpenCore Legacy Patcher
* macOS Sonoma

## 1. Homebrew導入

Homebrewをインストールする。

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
動作確認

```bash
brew --version
```

---

## 2. dotFiles取得

workspaceを作成する。

```bash
mkdir -p ~/workspace
cd ~/workspace
```

dotFilesを取得する。

```bash
git clone <repository>
```

---

## 3. Homebrewパッケージ導入

```bash
cd ~/workspace/dotFiles
brew bundle
```

導入内容は Brewfile を参照。

---

## 4. dotFiles展開

```bash
cd ~/workspace/dotFiles
./install.sh
```

実施内容

* ~/.zshrc
* ~/.gitconfig
* ~/.config/nvim

のシンボリックリンク作成

---

## 5. シェル再起動

```bash
exec zsh
```

または新規ターミナルを開く。

---

## 6. Neovim確認

```bash
nvim
```

初回起動時に lazy.nvim がプラグインを導入することを確認。

---

## 7. VSCode確認

```bash
code
```

確認項目

* Cortex-Debug
* Peripheral Viewer
* Memory View
* RTOS Views

---

## 8. STM32環境構築

stm32.md を参照。

---

## 9. ESP32環境構築

esp32.md を参照。

---

## 完了条件

以下が正常動作すること。

```bash
nvim --version
git --version
openocd --version
```

また、VSCodeが起動し Cortex-Debug が利用可能であること。

