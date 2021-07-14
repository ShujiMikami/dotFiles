DOTFILES_ROOTを環境変数として定義

メインエディタ : neovim
  プラグイン
    パッケージ管理 : dein をNEOVIM_ROOT/../deinにインストール
    補完表示 : deoplete
    LSPクライアント : LanguageClient
    Markdown,Plantumlプレビュワー : markdown_previewer
    ファイラ : nerdtree
    plantuml強調表示 : plantuml-syntax
    ステータスバー : vim-airline-theme, vim-airline
    latexビルド : vim-quickrun, vimtex
  カラーテーマ
    molokai

  NEOVIM_ROOT を環境変数として定義
  NEOVIM_ROOT/binをPATHに追加

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

    PYENV_ROOTを環境変数として定義
    PYENV_ROOT/binをPATHに追加
    eval pyenv init -を追加

    <Ubuntuのみ>pipenvを動かすため
    Home/.local/binをPATHに追加

C/C++コーディング環境
  LLVM : c/c++補完用
  LLVM_ROOT を環境変数として定義
  LLVM_ROOT/bin をPATHに追加

  stm32CubuMX : STM32コードジェネレータ
  
  arm-none-eabi-gcc : ARMマイコンクロスコンパイラ
  ARM_NONE_EABI_TOOLS_ROOT を環境変数として定義
  ARM_NONE_EABI_TOOLS_ROOT/binをPATHに追加

Latex環境
  TexLive : Texビルド
  latexmk : Texビルド
  texlab : Tex補完
  TEXLAB_ROOT を環境変数として定義
  TEXLAB_ROOT をPATHに追加

デバッグ環境
  VisualStudioCode : デバッグ用IDE
    プラグイン
      Cortex-Debug : ARMマイコンデバッグ環境

  open-ocd : C/C++デバッグ用
  OPEN_OCD_ROOTを環境変数として定義
  OPEN_OCD_ROOT/binをPATHに追加

sshfs環境
  osxfuse : macのみ必要
  sshfs : 本体
