# STM32開発環境

## 対象環境

* macOS Sonoma
* Neovim
* VSCode
* STM32CubeMX
* STM32CubeCLT
* OpenOCD

---

## 開発方針

エディタ

* Neovim

デバッグ

* VSCode
* Cortex-Debug

Git操作

* SourceTree

---

## STM32CubeMX

ST公式サイトからインストールする。

プロジェクト生成時は

Toolchain / IDE

```text
CMake
```

を選択する。

---

## STM32CubeCLT

ST公式サイトからインストールする。

STM32CubeCLTには以下が含まれる。

* arm-none-eabi-gcc
* arm-none-eabi-gdb
* cmake
* ninja
* STM32_Programmer_CLI

STM32CubeProgrammerは別途インストール不要。

---

## PATH設定

CubeCLTインストール後もPATHは自動設定されない。

PATH設定は

```text
dotFiles/zsh/tools/stm32.zsh
```

で管理する。

設定反映後確認

```bash
which arm-none-eabi-gcc
which arm-none-eabi-gdb
which cmake
which ninja
which STM32_Programmer_CLI
```

---

## OpenOCD

Homebrew管理。

確認

```bash
openocd --version
```

---

## 新規プロジェクト作成

CubeMXでプロジェクトを生成する。

生成方式

```text
CMake
```

を選択する。

---

## テンプレート適用

以下をコピーする。

```text
dotFiles/templates/stm32/
├── .vscode/
└── scripts/
```

コピー後の構成例

```text
project/
├── .vscode/
│   ├── launch.json
│   └── tasks.json
├── scripts/
│   ├── build.sh
│   ├── clean.sh
│   └── flash.sh
├── Core/
├── Drivers/
├── build/
├── CMakeLists.txt
└── CMakePresets.json
```

---

## ビルド

Debug

```bash
scripts/build.sh Debug
```

Release

```bash
scripts/build.sh Release
```

build.sh は内部で

```bash
cmake --preset <Preset> \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

cmake --build --preset <Preset>
```

を実行する。

これにより

* Configure
* compile_commands.json更新
* Build

が毎回実施される。

そのため

* ソース追加
* ディレクトリ変更
* CubeMX再生成
* CMakeLists.txt変更

などを意識せずビルドできる。

---

## compile_commands.json

clangd用の

```text
compile_commands.json
```

は build.sh により自動生成される。

確認

```bash
find . -name compile_commands.json
```

---

## クリーン

```bash
scripts/clean.sh
```

buildディレクトリを削除する。

---

## 書き込み

Debug

```bash
scripts/flash.sh Debug
```

Release

```bash
scripts/flash.sh Release
```

flash.sh は内部で build.sh を実行した後に書き込みを行う。

---

## clangd確認

Neovimでプロジェクトを開く。

確認項目

* 定義ジャンプ
* Hover
* 参照検索
* HAL関数認識

---

## OpenOCD確認

```bash
openocd \
  -f interface/stlink.cfg \
  -f target/stm32l4x.cfg
```

---

## GDB確認

```bash
arm-none-eabi-gdb build/Debug/<project>.elf
```

接続

```gdb
target remote localhost:3333
monitor reset halt
load
continue
```

停止

```text
Ctrl+C
```

---

## VSCodeデバッグ

必要拡張

* Cortex-Debug
* Debug Tracker
* Memory View
* Peripheral Viewer
* RTOS Views

期待動作

```text
F5
↓
build.sh実行
↓
OpenOCD起動
↓
書込み
↓
main停止
```

---

## nvim-dap

現状不採用。

GNU Tools for STM32付属のgdbでは

```text
--interpreter=dap
```

が利用できず、nvim-dapが動作しない。

現状は

```text
Neovim
+
VSCode(Cortex-Debug)
```

構成を採用する。

---

## テンプレート管理方針

STM32プロジェクト共通設定は

```text
dotFiles/templates/stm32
```

で管理する。

主な管理対象

* .vscode
* build.sh
* clean.sh
* flash.sh

新規プロジェクト作成時はテンプレートをコピーして利用する。

