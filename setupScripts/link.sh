# カレントディレクトリパスを取得
SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# dotFilesディレクトリ
DOTFILES_DIR=$SCRIPT_DIR/..

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
ln -s $DOTFILES_DIR/.bashrc .bashrc

# .bash_profileがあれば, 削除
if [ -e ".bash_profile" ];then
  rm -r .bash_profile
fi

# .profileを.profileの名前でHOMEにシンボリックリンク
ln -s $DOTFILES_DIR/.bash_profile .bash_profile

# .profileがあれば, 削除
if [ -e ".profile" ];then
  rm -r .profile
fi

# .profileを.profileの名前でHOMEにシンボリックリンク
ln -s $DOTFILES_DIR/.profile .profile



