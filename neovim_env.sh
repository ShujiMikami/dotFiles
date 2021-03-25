# カレントディレクトリパスを取得
DOTFILES_DIR=$(cd $(dirname $0) && pwd)

mkdir $DOTFILES_DIR/.cache/neovim

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  #linux
  echo "LINUX"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz 
  tar xzf nvim-macos.tar.gz
  mv nvim-osx64 $DOTFILES_DIR/.cache/neovim
fi

echo "export NEOVIM_ROOT="$DOTFILES_DIR/.cache/neovim/nvim-osx64" #neovim root directory" >> $DOTFILES_DIR/.cache/.profile_neovim
echo 'export PATH="$PATH:$NEOVIM_ROOT/bin" #neovim executable path' >> $DOTFILES_DIR/.cache/.profile_neovim
source $DOTFILES_DIR/.cache/.profile_neovim

pyenv install 3.9.2
pyenv install 2.7.18
pyenv virtualenv 3.9.2 nvim-python3
pyenv virtualenv 2.7.18 nvim-python2
pyenv activate nvim-python3
pip3 install pynvim
pyenv deactivate nvim-python3

pyenv activate nvim-python2
pip install pynvim
pyenv deactivate nvim-python2


