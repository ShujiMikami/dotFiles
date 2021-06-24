メインエディタ : neovim
  プラグイン
    パッケージ管理 : dein
    補完表示 : deoplete
    LSPクライアント : LanguageClient
    Markdown,Plantumlプレビュワー : markdown_previewer
    ファイラ : nerdtree
    plantuml強調表示 : plantuml-syntax
    ステータスバー : vim-airline-theme, vim-airline
    latexビルド : vim-quickrun, vimtex
  カラーテーマ
    molokai

pythonコーディング環境
  グローバルバージョン : 3.8
    モジュール
      pyenv or pyenv-win : インストールバージョン管理
      pipenv : 環境構築, 管理
  環境用仮想環境
    バージョン : 3.8
      モジュール
        pynvim : neovim動作補助
        python-language-server : python言語補完
        compiledb : compile_commands.json生成
    バージョン : 2.7
      モジュール
        pynvim : neovim動作補助

C/C++コーディング環境
  arm-none-eabi-gcc : ARMマイコンクロスコンパイラ
  LLVM : c/c++補完用
  stm32CubuMX : STM32コードジェネレータ
  eclipse & sw4stm32 : OpenOCD, GDB取得用

Latex環境
  TexLive : Texビルド
  latexmk : Texビルド
  texlab : Tex補完

デバッグ環境
  VisualStudioCode : デバッグ用IDE
    プラグイン
      Cortex-Debug : ARMマイコンデバッグ環境

  open-ocd : C/C++デバッグ用

sshfs環境
  osxfuse : macのみ必要
  sshfs : 本体
