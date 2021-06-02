# カレントディレクトリパスを取得
DOTFILES_DIR=$(cd $(dirname $0) && pwd)
TARGET_DIR=$DOTFILES_DIR/.cache/Applications/neovim
PROFILE=$DOTFILES_DIR/.cache/Profiles/.profile_neovim

#.bash_profileへの記載文字列
BASH_PROFILE_STRING="if [ -f $PROFILE ] ; then source ${PROFILE} ; fi #neovim path settings"
BASH_PROFILE_STRING_4_SEARCH="if \[ -f $PROFILE \] ; then source ${PROFILE} ; fi #neovim path settings"


if [ ! -d $TARGET_DIR ] ; then
  mkdir $TARGET_DIR
fi

if [ -f $PROFILE ] ; then
  rm $PROFILE
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

if grep -q "$BASH_PROFILE_STRING_4_SEARCH" ~/.bash_profile ; then
  echo "already exists"
else
  echo -e "$BASH_PROFILE_STRING" >> ~/.bash_profile
fi
source ~/.bash_profile
