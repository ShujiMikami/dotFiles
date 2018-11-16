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

# .bashrcを.bashrcの名前でHOMEにシンボリックリンク
ln -s $SCRIPT_DIR/.bashrc .bashrc

# .bash_profileを.bash_profileの名前でHOMEにシンボリックリンク
ln -s $SCRIPT_DIR/.bash_profile .bash_profile

# .latexmkrcをシンボリックリンク
ln -s $SCRIPT_DIR/.latexmkrc .latexmkrc
