# カレントディレクトリパスを取得
SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# HOMEフォルダに移動
cd ~

# .vimrcを.vimrcの名前でHOMEにシンボリックリンク
ln -s $SCRIPT_DIR/.vimrc .vimrc

# .gvimrcを.gvimrcの名前でHOMEにシンボリックリンク
ln -s $SCRIPT_DIR/.gvimrc .gvimrc

# .vimを.vimの名前でHOMEにシンボリックリンク
ln -s $SCRIPT_DIR/.vim .vim


