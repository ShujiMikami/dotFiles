# カレントディレクトリパスを取得
SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# HOMEフォルダに移動
cd ~

# .configフォルダがなければ作成
if [ ! -d ".config" ];then
  mkdir .config
fi

# .bashrcがあれば, 削除
if [ -e ".bashrc" ];then
  rm -r .bashrc
fi
# .bashrcを.bashrcの名前でHOMEにシンボリックリンク
ln -s $SCRIPT_DIR/.bashrc .bashrc

# .bash_profileがあれば, 削除
if [ -e ".bash_profile" ];then
  rm -r .bash_profile
fi
# .bash_profileを.bash_profileの名前でHOMEにシンボリックリンク
ln -s $SCRIPT_DIR/.bash_profile .bash_profile

# .latexmkrcがあれば, 削除
if [ -e ".latexmkrc" ];then
  rm -r .latexmkrc
fi
# .latexmkrcをシンボリックリンク
ln -s $SCRIPT_DIR/.latexmkrc .latexmkrc

# .configに移動
cd .config

# nvimフォルダをシンボリックリンク
ln -s $SCRIPT_DIR/neovim/nvim nvim

