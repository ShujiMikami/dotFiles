# TWELITE 開発環境

## 概要

本環境では以下の構成で TWELITE の開発を行う。

* エディタ: Neovim
* LSP: clangd
* ビルド: make
* コンパイルデータベース生成: compiledb
* SDK: TWELITE STAGE SDK (MWSDK)
* 書き込みツール: tweterm.py
* OS: macOS Sonoma
* シェル: zsh

本ドキュメントは Mac 環境での TWELITE 開発環境構築手順をまとめたものである。

---

## SDK の導入

TWELITE STAGE SDK を任意の場所へ展開する。

例:

```text
~/workspace/MWSTAGE202508_macOS_R2/
```

MWSDK は TWELITE STAGE SDK に同梱されている。

```text
MWSTAGE202508_macOS_R2/
├── MWSDK
├── Tools
├── TWELITE_Stage
└── ...
```

---

## MWSDK_ROOT

TWELITE のビルドには `MWSDK_ROOT` 環境変数が必要である。

環境変数は以下のファイルで管理している。

```text
dotFiles/zsh/tools/twelite.zsh
```

SDK を配置した場所に合わせて `MWSDK_ROOT` を設定すること。

例:

```bash
export MWSDK_ROOT="$HOME/workspace/MWSTAGE202508_macOS_R2/MWSDK"
```

---

## tweterm.py

TWELITEの最新SDKでは, TWELITE Stage Appを使用することが想定されており, SDKからtweterm.pyは削除されている. 
しかし, TWELITE State Appは, twelite-Rの使用を想定されているのか, 一般のUSB-UART変換基板, チップでの接続ができないか, 不安定である. 事実, MacPro2012 + oclp + sonomaの環境では, FTDIチップの存在を検出できなかった. 
従って, tweterm.pyを使う必要があり, また, pythonスクリプトということもあり, ターミナル操作との相性もよい. 
最新SDKでは削除されているため, 古いSDKを別途ダウンロードし, そこから取得する必要がある.  
どこまで遡る必要があるかは未確認であるが, 現状, MWSTAGE-2020-10_osx-3.zipをダウンロードし, Tools以下のフォルダを, 最新SDKのTools以下にコピーされることを, dotFilesでは想定している. 

---

## プロジェクト作成

新規プロジェクト作成時は、以下のテンプレートを利用する。

```text
dotFiles/templates/twelite/
```

テンプレート内のファイル・ディレクトリをプロジェクトへコピーすること。

---

## ビルド

TWELITE の標準的なビルド方法は build ディレクトリでの make 実行である。

```bash
cd build
make TWELITE=BLUE
```

クリーン:

```bash
make cleanall
```

また、テンプレートにはビルド補助スクリプトを配置している。

```text
scripts/build.sh
```

通常はこちらを利用する。

---

## compile_commands.json

clangd 用の `compile_commands.json` は `compiledb` を使用して生成する。

```bash
compiledb make TWELITE=BLUE
```

生成された `compile_commands.json` はプロジェクトルートへ配置される。

### 注意

`bear` では正しく生成できなかった。

TWELITE 環境では `compiledb` を利用すること。

テンプレートには生成用スクリプトを配置している。

```text
scripts/gen_compile_db.sh
```

通常はこちらを利用する。

---

## .clangd

TWELITE 用の `.clangd` はテンプレートに含まれている。

```text
dotFiles/templates/twelite/.clangd
```

新規プロジェクト作成時はテンプレートからコピーすること。

### 設定内容

TWELITE は独自 GCC (`ba-elf-gcc`) を使用する。

clangd が認識できないコンパイラオプションを除去している。

```yaml
CompileFlags:
  Remove:
    - -mbranch-cost=*
    - -mredzone-size=*
    - -mcpu=*
    - -march=*
```

---

## clangd

### Apple clangd

macOS 標準の Apple clangd でも基本的な補完は動作する。

ただし、

```c
#ifdef ...
#endif
```

などで無効化されているコードの判定が不十分で、

* 無効コードが通常コードと同じ見た目になる
* clangd の解析結果が分かりにくい

といった問題が発生する場合がある。

### LLVM clangd

Homebrew 版 LLVM の clangd を利用することを推奨する。

インストール:

```bash
brew install llvm
```

PATH 追加:

```bash
export PATH="/usr/local/opt/llvm/bin:$PATH"
```

確認:

```bash
which clangd
clangd --version
```

LLVM 版では条件コンパイルによる無効コードが適切に表示される。

---

## 書き込み

書き込みには tweterm.pyを使用する. 
tweterm.pyは, libusbを使用する関係で, FTDIのVCPドライバが稼働していると, USBデバイスにアクセスができない. そこで, tweterm.pyを起動する前に, 

```bash
sudo kextunload -b com.FTDI.driver.FTDIUSBSerialDriver
```

により, FTDIのVCPドライバをアンロードする必要がある. 
tweterm.pyでの書き込みが終わったら, 

```bash
sudo kextload -b com.FTDI.driver.FTDIUSBSerialDriver
```

により, 再ロードする. 

また、テンプレートにはビルド補助スクリプトを配置している。

```text
scripts/flash.sh
```

通常はこちらを利用する。

### pyftdiのバージョン

tweterm.pyは, 内部のコードが古く, 最新のpyftdiを使うと, 実行エラーになってしまう. どこまで遡ればよいかは未確認であるが, dotFilesでは, 0.30.3を使用することを想定している. 

---

## Neovim 動作確認

以下が動作することを確認する。

* 補完
* Hover
* 定義ジャンプ
* 参照検索

例:

```text
K
gd
grr
```

---

## 条件コンパイル

TWELITE では `#ifdef` が多用される。

無効コード上では clangd は解析を行わない。

そのため、

```text
No location found
No information available
```

が表示される場合は、まず対象コードが条件コンパイルによって無効化されていないか確認すること。

LLVM 版 clangd を使用すると判別しやすい。

---

## VSCode

VSCode は必須ではない。

clangd が正常動作していれば Neovim のみで開発可能である。

---


## Brewfile

TWELITE 開発で追加した主なパッケージ。

```ruby
brew "compiledb"
brew "llvm"
```

## python

tweterm.pyが非常に古いことから, pythonとしては少し古めの3.11.15を指定している. templateの.python_versionにて記載がある. 
pyftdiとpyserialが必要であり, pyftdiは特に古いものを使わなければならないことから, venvによる仮想環境構築を前提としている. 
templateの.envrc内で仮想環境の作成はしているが, 初回一度だけ, 
```bash
pip install -r requirements.txt
```

を実施する必要がある. 
以降は, direnvの効果により, ディレクトリにいる限りは, 仮想環境が起動する. 

---

## 今後の改善候補

* query-driver の評価
* テンプレート改善
* build スクリプト改善
* MONOSTICK 運用手順整理
* 書込み手順詳細化

---

