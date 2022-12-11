# カレントディレクトリパスを取得
CURRENT_DIR=$(cd $(dirname $0) && pwd)

# dotFiles/neovim/nvimを.configにシンボリックリンク
if [ ! -d "~/.config/nvim" ];then
  rm -r ~/.config/nvim
fi
ln -s $CURRENT_DIR/../neovim/nvim ~/.config/nvim

# neovim/nvim-python3を.cacheにコピー
cp -r $CURRENT_DIR/../neovim/nvim-python3 ~/.cache/ 

# neovim/nvim-python2を.cacheにコピー
cp -r $CURRENT_DIR/../neovim/nvim-python2 ~/.cache/ 

# pipenvのpipファイル直下に仮想環境を作成する設定
export PIPENV_VENV_IN_PROJECT=1

# neovim/nvim-python3の下でpipenv sync
cd ~/.cache/nvim-python3
pipenv sync

# neovim/nvim-python2の下でpipenv sync
cd ~/.cache/nvim-python2
pipenv sync


