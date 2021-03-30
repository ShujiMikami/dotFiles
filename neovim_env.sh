# カレントディレクトリパスを取得
DOTFILES_DIR=$(cd $(dirname $0) && pwd)
TARGET_DIR=$DOTFILES_DIR/.cache/Applications/neovim
PROFILE=$DOTFILES_DIR/.cache/Profiles/.profile_neovim

if [ ! -d $TARGET_DIR ] ; then
  mkdir $TARGET_DIR
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  #linux
  echo "LINUX"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz 
  tar xzf nvim-macos.tar.gz
  mv nvim-osx64 $TARGET_DIR
  echo "export NEOVIM_ROOT="$TARGET_DIR/nvim-osx64" #neovim root directory" >> $PROFILE
fi

echo 'export PATH="$PATH:$NEOVIM_ROOT/bin" #neovim executable path' >> $PROFILE
source $DOTFILES_DIR/.cache/.profile_neovim

pyenv install 3.9.2
pyenv install 2.7.18

pyenv virtualenv 3.9.2 nvim-python3

pyenv virtualenv 2.7.18 nvim-python2

eval "$(pyenv init -)"
eval "$(pyenv vertualenv-init -)"

pyenv activate nvim-python3
pip3 install pynvim
pyenv deactivate nvim-python3

pyenv activate nvim-python2
pip install pynvim
pyenv deactivate nvim-python2

if ! command -v cat ~/.bash_profile | grep "#neovim path settings" 1>/dev/null 2>&1 ; then
  echo -e "#neovim path settings\nif [ -f $PROFILE ] ; then\n  source $PROFILE\nfi" >> ~/.bash_profile
fi

source ~/.bash_profile
