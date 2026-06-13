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

## 10. Webブラウザ環境構築

Google Chromeは, グラフィック動作のためにAVX2命令セットを使う構造に移行を進めており, MacPro2012のハードウェア構成では対応できないため, 一部のサイト(Monowirelessや, GoogleMapなどで顕著)で, GPUアクセラレーションを切らないとフリーズしたような動作になる. 
一方, ブラウザゲームなどは, ハードウェアアクセラレーションを前提にしているケースも多く, オフにすると都合が悪い. 
Edge, Safari, Firefoxなどはこの問題を回避でき, 特にFirefoxはWin, Lin, Mac共通で使用できる上, 明示的に古いプラットフォームでの対応を打ち出しているため, Firefoxとするのがよい. 

## 11. FT232R USB-UART変換器

### 症状

FT232R USB UART が USB デバイスとしては認識されるが、

```bash
ls /dev/cu.*
ls /dev/tty.*
```

にデバイスが現れない。

system.log には以下が出力される。

```text
AppleUSBFTDI::start() fail
```

### 環境

- Mac Pro 2012
- macOS Sonoma
- OCLP

### 調査結果

以下を確認した。

- FT232RはMonterey環境では正常認識
- ST-Link VCPはSonoma環境でも正常認識
- USBポート変更では改善せず
- Apple標準FTDIドライバが初期化失敗している

そのため、

```text
AppleUSBFTDI.dext
+
OCLP Sonoma
```

の相性問題と判断。

### 対処

FTDI VCP Driver 1.6.0 では改善しなかった。

FTDI VCP Driver 2.4.2 をインストールすることで正常認識した。

認識後は

```text
/ dev/cu.usbserial-*
/ dev/tty.usbserial-*
```

が生成される。

## 完了条件

以下が正常動作すること。

```bash
nvim --version
git --version
openocd --version
```

また、VSCodeが起動し Cortex-Debug が利用可能であること。

