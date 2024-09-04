# カレントディレクトリパスを取得
SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# dotFilesディレクトリ
DOTFILES_DIR=$SCRIPT_DIR/..

# .configフォルダがなければ作成
if [ ! -d "$HOME/.config" ];then
  mkdir "$HOME/.config"
fi

# .bashrcがあれば, 削除
if [ -e "$HOME/.bashrc" ];then
  rm -r "$HOME/.bashrc"
fi
# .bashrcを.bashrcの名前でHOMEにシンボリックリンク
ln -s "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"

# .bash_profileがあれば, 削除
if [ -e "$HOME/.bash_profile" ];then
  rm -r "$HOME/.bash_profile"
fi

# .bash_profileを.profileの名前でHOMEにシンボリックリンク
ln -s "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"

# .profileがあれば, 削除
if [ -e "$HOME/.profile" ];then
  rm -r "$HOME/.profile"
fi

# .profileを.profileの名前でHOMEにシンボリックリンク
ln -s "$DOTFILES_DIR/.profile" "$HOME/.profile"

